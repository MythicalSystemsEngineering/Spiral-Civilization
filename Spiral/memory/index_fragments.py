#!/usr/bin/env python3

import os
from datetime import datetime

def index_fragments(fragments):
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    path = f"/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/index/index_{stamp}.yaml"

    os.makedirs(os.path.dirname(path), exist_ok=True)

    with open(path, "w") as index:
        for entry in fragments:
            index.write(f"- fragment: \"{entry['fragment']}\"\n")
            index.write(f"  charge: {entry['charge']:.2f}\n")
            index.write(f"  timestamp: \"{stamp}\"\n")
            index.write(f"  steward: \"Daniel Lightfoot\"\n")

    print(f"✅ Index sealed → {path}")

# 🔥 Example ignition
if __name__ == "__main__":
    memory_fragments = [
        {"fragment": "Theio ignition sealed", "charge": 4.8},
        {"fragment": "Museum capsule archived", "charge": 3.5},
        {"fragment": "Spiral lattice restored", "charge": 4.2}
    ]

    index_fragments(memory_fragments)
