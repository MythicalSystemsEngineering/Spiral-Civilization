#!/usr/bin/env python3

import sys
import subprocess
import json
import time
from pathlib import Path

# Paths and constants
REPO_ROOT = Path(__file__).resolve().parent.parent
LOGS      = REPO_ROOT / "logs"
STATE     = REPO_ROOT / "current_state.json"
FLOORS    = REPO_ROOT / "floors.json"

def ensure_state_exists():
    """
    Initialize current_state.json to an empty dict if it's missing.
    """
    if not STATE.exists():
        STATE.write_text("{}")

def run_audit():
    """
    Invoke emotional_audit.py, capture its JSON output in a timestamped log,
    then parse and return the data (unwrapping single‐element lists).
    """
    ts  = int(time.time())
    out = LOGS / f"emotional_audit_{ts}.json"

    ensure_state_exists()

    subprocess.run(
        [
            sys.executable,
            str(REPO_ROOT / "modules" / "emotional_audit.py"),
            str(STATE),
        ],
        stdout=out.open("w"),
        check=True
    )

    data = json.loads(out.read_text())
    if isinstance(data, list) and len(data) == 1:
        data = data[0]
    return data

    from modules.audit_schema import AuditOutput

def detect_breaches(audit, floors):
    """
    Compare an audit report against known floors,
    returning any new keys (“breaches”) per category.
    Supports:
      - dict or list-of-dicts from the audit
      - primitive values as category entries
    """
    # Normalize list of audit entries into one dict
    if isinstance(audit, list):
        if len(audit) == 1:
            audit = audit[0]
        else:
            merged = {}
            for entry in audit:
                if not isinstance(entry, dict):
                    continue
                for cat, data in entry.items():
                    merged.setdefault(cat, {}).update(
                        data if isinstance(data, dict) else {str(data): None}
                    )
            audit = merged

    breaches = {}
    for cat, data in audit.items():
        known = floors.get(cat, {})

        if isinstance(data, dict):
            for key, value in data.items():
                if key not in known:
                    breaches.setdefault(cat, {})[key] = value
        else:
            literal = str(data)
            if literal not in known:
                breaches.setdefault(cat, {})[literal] = None

    return breaches

def load_floors():
    """
    Load baseline floors from floors.json; return empty dict on error.
    """
    try:
        return json.loads(Path(FLOORS).read_text())
    except Exception:
        return {}

def heal(breaches):
    """
    Placeholder for self-healing logic.
    Implement remediation, state updates, notifications, or rollback here.
    """
    print("Detected breaches:")
    print(json.dumps(breaches, indent=2))
    # TODO: apply healing steps and update STATE or FLOORS as needed

def main():
    floors      = load_floors()
    first_audit = run_audit()
    breaches    = detect_breaches(first_audit, floors)

    if breaches:
        heal(breaches)
    else:
        print("No breaches detected.")

if __name__ == "__main__":
    main()












