import json
import unicodedata
import re
from pathlib import Path

LEDGER_FILE = Path("ledger.json")

# ------------------------
# Core Load / Save
# ------------------------
def load_ledger():
    if LEDGER_FILE.exists():
        with open(LEDGER_FILE, "r", encoding="utf-8") as f:
            return json.load(f)
    return {"motions": []}

def save_ledger(ledger):
    with open(LEDGER_FILE, "w", encoding="utf-8") as f:
        json.dump(ledger, f, indent=2, ensure_ascii=False)

# ------------------------
# Migration — One Time Use
# ------------------------
def migrate_old_format(ledger):
    """
    Convert any old-format motions into the current schema.
    """
    new_motions = []
    for entry in ledger.get("motions", []):
        if "motion" in entry and "choice" in entry:
            new_motions.append({
                "title": entry["motion"],
                "description": "",
                "votes": [{
                    "choice": entry["choice"],
                    "mood": entry.get("mood", ""),
                    "opinion": entry.get("opinion", 0.0),
                    "witness": entry.get("witness", "")
                }]
            })
        elif "title" in entry and "votes" in entry:
            new_motions.append(entry)
        else:
            print(f"Skipping unknown motion format: {entry}")
    return {"motions": new_motions}

# ------------------------
# Normalization & Merge
# ------------------------
def normalize_title(title):
    """Normalize motion titles for reliable comparisons."""
    return unicodedata.normalize("NFKC", title).strip().lower()

def merge_duplicate_motions(ledger):
    """
    Merge motions with the same normalized title and consolidate votes.
    """
    seen = {}
    merged_motions = []
    for motion in ledger.get("motions", []):
        norm_title = normalize_title(motion.get("title", ""))
        if norm_title in seen:
            seen[norm_title]["votes"].extend(motion.get("votes", []))
        else:
            seen[norm_title] = {
                "title": motion.get("title", ""),
                "description": motion.get("description", ""),
                "votes": list(motion.get("votes", []))
            }
            merged_motions.append(seen[norm_title])
    # Deduplicate identical votes
    for motion in merged_motions:
        unique_votes = []
        seen_votes = set()
        for v in motion["votes"]:
            sig = (v.get("choice"), v.get("mood"), v.get("opinion"), v.get("witness"))
            if sig not in seen_votes:
                seen_votes.add(sig)
                unique_votes.append(v)
        motion["votes"] = unique_votes
    return {"motions": merged_motions}

# ------------------------
# Add / Update Helpers
# ------------------------
def add_motion(ledger, title, description=""):
    ledger["motions"].append({
        "title": title,
        "description": description,
        "votes": []
    })

def add_vote(ledger, title, choice, mood="", opinion=0.0, witness=""):
    for motion in ledger["motions"]:
        if normalize_title(motion["title"]) == normalize_title(title):
            motion["votes"].append({
                "choice": choice,
                "mood": mood,
                "opinion": opinion,
                "witness": witness
            })
            return
    # Create motion if it doesn't exist yet
    add_motion(ledger, title)
    add_vote(ledger, title, choice, mood, opinion, witness)

# ------------------------
# Audit Output
# ------------------------
def audit(ledger):
    """
    Print a readable report of all motions and their votes.
    """
    print("\n-- Audit Motions --")
    if not ledger.get("motions"):
        print("No motions recorded.")
        return

    for motion in ledger["motions"]:
        print(f"\nTitle: {motion.get('title', '')}")
        if motion.get("description"):
            print(f"Description: {motion['description']}")
        if not motion.get("votes"):
            print("  No votes recorded.")
        else:
            for v in motion["votes"]:
                choice = v.get("choice", "")
                mood = v.get("mood", "")
                opinion = v.get("opinion", "")
                witness = v.get("witness", "")
                print(f"  - {choice} (mood: {mood}, opinion: {opinion}, witness: {witness})")
