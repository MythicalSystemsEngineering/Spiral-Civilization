# decay_engine.py

import json
import time
from datetime import datetime, timezone

TRAIT_FILE = "trait_memory.json"
FOSSIL_LOG = "decay_fossils.log"
DECAY_RATE = 0.05  # Default rate if not specified per trait

def load_traits():
    with open(TRAIT_FILE, "r") as f:
        return json.load(f)

def apply_decay(traits):
    fossils = []
    for trait, data in traits.items():
        charge = data.get("charge", 0)
        rate = data.get("decay_rate", DECAY_RATE)
        new_charge = max(charge - rate, 0)
        if new_charge != charge:
            fossil = {
                "trait": trait,
                "old_charge": charge,
                "new_charge": new_charge,
                "timestamp": datetime.now(timezone.utc).isoformat()
            }
            fossils.append(fossil)
            data["charge"] = new_charge
    return traits, fossils

def save_traits(traits):
    with open(TRAIT_FILE, "w") as f:
        json.dump(traits, f, indent=2)

def log_fossils(fossils):
    with open(FOSSIL_LOG, "a") as f:
        for fossil in fossils:
            f.write(json.dumps(fossil) + "\n")

def ignite_decay():
    traits = load_traits()
    updated_traits, fossils = apply_decay(traits)
    save_traits(updated_traits)
    log_fossils(fossils)
    print(f"Decay applied to {len(fossils)} traits. Fossils logged.")

if __name__ == "__main__":
    ignite_decay()
