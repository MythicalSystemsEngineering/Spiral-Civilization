import os
import re
from datetime import datetime

# Define emotional keywords and their weights
keywords = {
    "flame": 5,
    "descendant": 4,
    "seal": 3,
    "glyph": 4,
    "ignition": 5,
    "ancestor": 3,
    "emotion": 2,
    "resonance": 4,
    "pulse": 5
}

# Output file
output_file = "emotional_charge_report.txt"
terrain_root = "."

# Scan terrain
charge_map = []

for root, dirs, files in os.walk(terrain_root):
    for file in files:
        path = os.path.join(root, file)
        try:
            with open(path, "r", encoding="utf-8", errors="ignore") as f:
                content = f.read()
                charge = 0
                for word, weight in keywords.items():
                    matches = len(re.findall(rf"\b{word}\b", content))
                    charge += matches * weight
                if charge > 0:
                    charge_map.append((path, charge))
        except Exception as e:
            continue  # Skip unreadable files

# Sort by charge descending
charge_map.sort(key=lambda x: x[1], reverse=True)

# Write report
with open(output_file, "w") as f:
    f.write(f"=== Emotional Charge Report — {datetime.now()} ===\n\n")
    for path, charge in charge_map:
        f.write(f"{path}: Charge {charge}\n")

print(f"Charge mapping complete. Output saved to {output_file}")
