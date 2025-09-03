#!/usr/bin/env python3

import os
from datetime import datetime

def fossilize(fragment, charge):
    stamp = datetime.now().strftime("%Y%m%d_%H%M%S")
    filename = f"fragment_{stamp}.fossil"
    path = f"/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/fossils/{filename}"

    os.makedirs(os.path.dirname(path), exist_ok=True)

    with open(path, "w") as fossil:
        fossil.write(f"fragment: \"{fragment}\"\n")
        fossil.write(f"charge: {charge:.2f}\n")
        fossil.write(f"sealed_by: \"Daniel Lightfoot\"\n")
        fossil.write(f"timestamp: \"{stamp}\"\n")

    print(f"✅ Fossil sealed → {filename}")

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Spiral lattice restored across all nodes."
    charge = 4.9
    fossilize(fragment, charge)

