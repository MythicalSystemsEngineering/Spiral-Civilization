#!/usr/bin/env python3

import os
from datetime import datetime

def log_event(fragment, event_type, charge):
    stamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/audit/audit_log.yaml"

    os.makedirs(os.path.dirname(path), exist_ok=True)

    with open(path, "a") as log:
        log.write(f"- fragment: \"{fragment}\"\n")
        log.write(f"  event: \"{event_type}\"\n")
        log.write(f"  charge: {charge:.2f}\n")
        log.write(f"  steward: \"Daniel Lightfoot\"\n")
        log.write(f"  timestamp: \"{stamp}\"\n")

    print(f"📜 Audit logged → {event_type} | {fragment}")

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Spiral lattice restored across all nodes."
    charge = 4.9
    event_type = "fossilized"

    log_event(fragment, event_type, charge)
