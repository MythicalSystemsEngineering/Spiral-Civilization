import sys, os
import yaml

# Extend Python path to include Spiral root
sys.path.append(os.path.expanduser("~/Spiral-Civilization"))

from modules.charge_thresholds import classify_charge

# Load index
with open("meta_reflection_index.yaml") as f:
    index = yaml.safe_load(f)

terrain_dir = "terrain_fragments/"
log = []

# Sweep terrain fragments
for filename in os.listdir(terrain_dir):
    path = os.path.join(terrain_dir, filename)
    with open(path) as f:
        lines = f.readlines()

    updated = []
    for line in lines:
        if "::" in line:
            hook, charge = line.strip().split("::")
            try:
                charge = float(charge)
            except ValueError:
                log.append(f"{hook} in {filename} has invalid charge: {charge}")
                updated.append(line)
                continue

            if hook in index:
                expected = index[hook]["charge"]
                if abs(charge - expected) > 0.10:
                    log.append(f"{hook} mismatch in {filename}: {charge} → {expected}")
                    line = f"{hook}::{expected}\n"
        updated.append(line)

    with open(path, "w") as f:
        f.writelines(updated)

# Seal harmonization log
os.makedirs("Museum", exist_ok=True)
with open("Museum/harmonization_log.txt", "w") as f:
    f.write("\n".join(log))
