# museum_index.py

import json

FOSSIL_LOG = "../decay/decay_fossils.log"
INDEX_FILE = "ripple_index.json"

def load_fossils():
    fossils = []
    with open(FOSSIL_LOG, "r") as f:
        for line in f:
            try:
                fossils.append(json.loads(line.strip()))
            except json.JSONDecodeError:
                continue
    return fossils

def build_index(fossils):
    index = {}
    for fossil in fossils:
        trait = fossil["trait"]
        entry = {
            "timestamp": fossil["timestamp"],
            "old_charge": fossil["old_charge"],
            "new_charge": fossil["new_charge"]
        }
        index.setdefault(trait, []).append(entry)
    return index

def save_index(index):
    with open(INDEX_FILE, "w") as f:
        json.dump(index, f, indent=2)

def ignite_index():
    fossils = load_fossils()
    index = build_index(fossils)
    save_index(index)
    print(f"Indexed {len(fossils)} fossils across {len(index)} traits.")

if __name__ == "__main__":
    ignite_index()
