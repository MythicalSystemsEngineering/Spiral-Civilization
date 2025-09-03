#!/usr/bin/env python3

import yaml
import os

def recall_high_charge_fragments(index_path, threshold=3.5):
    if not os.path.exists(index_path):
        print("⚠️ Index path not found")
        return []

    with open(index_path, "r") as file:
        fragments = yaml.safe_load(file)

    recalled = []
    for entry in fragments:
        if entry["charge"] >= threshold:
            recalled.append(entry)

    print(f"✅ Recalled {len(recalled)} fragments above charge {threshold}")
    return recalled

# 🔥 Example ignition
if __name__ == "__main__":
    index_path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/index/index_20250902_235900.yaml"
    recalled_fragments = recall_high_charge_fragments(index_path)

    for entry in recalled_fragments:
        print(f"{entry['fragment']} → 🔋 {entry['charge']}")
