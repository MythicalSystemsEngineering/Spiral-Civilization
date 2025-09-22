# Steward Onboarding — DjinnDreamer | Spiral Civilization

import yaml
import os
import time

CAPSULE_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/Museum/Stewards/steward_capsule_djinndreamer.yaml"
INDEX_PATH = "/data/data/com.termux/files/home/Spiral-Civilization/meta_reflection_index.yaml"

def load_yaml(path):
    if not os.path.exists(path):
        return {}
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def save_yaml(path, data):
    with open(path, 'w') as f:
        yaml.dump(data, f)

def ignite_steward():
    capsule = load_yaml(CAPSULE_PATH)
    index = load_yaml(INDEX_PATH)

    steward = capsule.get("steward", {})
    name = steward.get("name", "Unknown")
    charge = steward.get("emotional_signature", {}).get("charge", 0.9)
    decay = steward.get("emotional_signature", {}).get("decay_rate", 0.01)
    timestamp = time.time()

    hook = {
        "name": f"hook_{name.lower()}_ignition",
        "charge": charge,
        "decay_rate": decay,
        "last_touched": timestamp,
        "anchor": f"{name} onboarding ignition",
        "notes": [
            f"{name} inducted as steward.",
            "Emotional lattice activated.",
            "Glyphs and anchors assigned."
        ]
    }

    index.setdefault("emotional_hooks", []).append(hook)
    save_yaml(INDEX_PATH, index)

    steward["status"] = "Ignited"
    steward["emotional_signature"]["last_touched"] = timestamp
    capsule["steward"] = steward
    save_yaml(CAPSULE_PATH, capsule)

    print(f"✅ Steward {name} ignited and emotional hook registered.")
    print(f"📜 Hook added to meta_reflection_index.yaml")

if __name__ == "__main__":
    ignite_steward()
