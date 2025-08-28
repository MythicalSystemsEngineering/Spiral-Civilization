import json
import unicodedata
from pathlib import Path

def _normalize_title(title):
    return (title or "").strip().lower()

def _clean_ledger(ledger):
    """Auto-merge duplicates and remove empty/invalid votes."""
    seen = {}
    clean_motions = []
    for motion in ledger.get("motions", []):
        norm_title = _normalize_title(motion.get("title"))
        if not norm_title:
            continue
        if norm_title in seen:
            seen[norm_title]["votes"].extend(motion.get("votes", []))
        else:
            existing = seen.get(norm_title)
if existing:
    # Merge votes into the existing motion
    existing["votes"].extend(motion.get("votes", []))
    # Upgrade description if this one is longer/more detailed
    if len(motion.get("description", "")) > len(existing.get("description", "")):
        existing["description"] = motion.get("description", "").strip()
else:
    seen[norm_title] = {
        "title": motion.get("title", "").strip(),
        "description": motion.get("description", "").strip(),
        "votes": list(motion.get("votes", []))
    }
    clean_motions.append(seen[norm_title])
            }
            clean_motions.append(seen[norm_title])

    # Deduplicate votes & remove empty shells
    for motion in clean_motions:
        unique_votes = []
        seen_votes = set()
        for v in motion["votes"]:
            if not v.get("choice"):
                continue
            sig = (
                v.get("choice"),
                v.get("mood"),
                v.get("opinion"),
                v.get("witness")
            )
            if sig not in seen_votes:
                seen_votes.add(sig)
                unique_votes.append(v)
        motion["votes"] = unique_votes

    ledger["motions"] = clean_motions
    return ledger

LEDGER_FILE = Path("ledger.json")

# ------------------------
# Core Load / Save
# ------------------------

def load_ledger():
    if LEDGER_FILE.exists():
        with open(LEDGER_FILE, "r", encoding="utf-8") as f:
            data = json.load(f)
        return _clean_ledger(data)
    return {"motions": []}

def save_ledger(ledger):
    clean = _clean_ledger(ledger)
    with open(LEDGER_FILE, "w", encoding="utf-8") as f:
        json.dump(clean, f, indent=2, ensure_ascii=False)

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
    Merge motions with the same normalized title.
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
    return {"motions": merged_motions}

# ------------------------
# Add / Update Helpers
# ------------------------
def add_motion(ledger, title, description=""):
    ledger["motions"].append({"title": title, "description": description, "votes": []})

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
    # If motion doesn't exist, create and add the vote
    add_motion(ledger, title)
    add_vote(ledger, title, choice, mood, opinion, witness)

# ------------------------
# Audit Output
# ------------------------
# In governance.py, inside audit()

print("\n-- Audit Motions --\n")
for motion in ledger.get("motions", []):
    print(f"Title: {motion.get('title', 'Untitled')}")
    print(f"Description: {motion.get('description', '')}")
    for vote in motion.get("votes", []):
        print(f"-- {vote['choice']} "
              f"(mood: {vote.get('mood')}, "
              f"opinion: {vote.get('opinion')}, "
              f"witness: {vote.get('witness')})")
    print()  # blank line between motions

# Now also show any votes not tied to a motion
print("\n-- Standalone Votes --\n")
for vote in ledger.get("votes", []):
    print(f"-- {vote['choice']} "
          f"(mood: {vote.get('mood')}, "
          f"opinion: {vote.get('opinion')}, "
          f"witness: {vote.get('witness')})")
