import sys
import json
from modules import governance as gov

def main():
    # === CORE: Always load first ===
    ledger = gov.load_ledger()

    # --- RAW DUMP ---
    if "--dump-ledger" in sys.argv:
        print(json.dumps(ledger, indent=2))
        sys.exit()

    # --- PRE-PROCESS ---
    ledger = gov.merge_duplicate_motions(ledger)
    ledger = gov.migrate_old_format(ledger)

    # --- CORE AUDIT ---
    if "--audit" in sys.argv:
        audit(ledger)
        sys.exit()

    # --- NEW FLAGS GO BELOW ---
    if "--new-motion" in sys.argv:
        add_motion(ledger)
        sys.exit()

    if "--tally" in sys.argv:
        tally_votes(ledger)
        sys.exit()

    # If no recognised flags:
    print("No valid command. Try --dump-ledger, --audit, --new-motion, or --tally.")

# ====== FUNCTIONS ======

def audit(ledger):
    """Print motions and their votes."""
    motions = ledger.get("motions", [])
    if not motions:
        print("No motions in ledger.")
        return

    for motion in motions:
        title = motion.get("title", "(untitled)")
        desc = motion.get("description", "")
        print(f"\nMotion: {title}")
        if desc:
            print(f"Description: {desc}")

        votes = motion.get("votes", [])
        if not votes:
            print("  No votes recorded.")
        else:
            for v in votes:
                choice = v.get("choice", "?")
                mood = v.get("mood", "?")
                opinion = v.get("opinion", "?")
                witness = v.get("witness", "?")
                print(f"  - Vote: {choice} "
                      f"(mood: {mood}, opinion: {opinion}, witness: {witness})")

def add_motion(ledger):
    """Example: prompt user in terminal, then save."""
    title = input("Enter motion title: ").strip()
    desc = input("Enter motion description: ").strip()
    motion = {"title": title, "description": desc, "votes": []}
    ledger.setdefault("motions", []).append(motion)
    gov.save_ledger(ledger)
    print(f"Motion '{title}' added and saved.")

def tally_votes(ledger):
    """Example: count yes/no votes per motion."""
    for motion in ledger.get("motions", []):
        yes_count = sum(1 for v in motion.get("votes", []) if v.get("choice") == "yes")
        no_count = sum(1 for v in motion.get("votes", []) if v.get("choice") == "no")
        print(f"\nMotion: {motion.get('title')}")
        print(f"  Yes: {yes_count}")
        print(f"  No: {no_count}")

if __name__ == "__main__":
    main()


