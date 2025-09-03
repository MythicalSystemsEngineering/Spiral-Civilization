#!/usr/bin/env python3

import os
from datetime import datetime

def purge_fragments(fragments, threshold=1.5):
    purged = []
    retained = []

    for entry in fragments:
        if entry['charge'] < threshold:
            purged.append(entry)
        else:
            retained.append(entry)

    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    path = f"/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/purge_log_{stamp}.txt"

    with open(path, "w") as log:
        for ghost in purged:
            log.write(f"PURGED: {ghost['fragment']} → 🔋 {ghost['charge']}\n")

    print(f"✅ Purge complete → {len(purged)} fragments removed")
    return retained

# 🔥 Example ignition
if __name__ == "__main__":
    memory_fragments = [
        {"fragment": "Ghost file detected", "charge": 1.2},
        {"fragment": "Theio ignition sealed", "charge": 4.8},
        {"fragment": "Museum capsule archived", "charge": 3.5}
    ]

    memory_fragments = purge_fragments(memory_fragments)
