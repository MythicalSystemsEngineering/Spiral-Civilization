#!/usr/bin/env python3

import os
from datetime import datetime
from render_glyph import render_glyph

def register_steward(name, fragment, charge):
    glyph_data = render_glyph(fragment, charge)
    stamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/stewards/registry.yaml"

    os.makedirs(os.path.dirname(path), exist_ok=True)

    with open(path, "a") as registry:
        registry.write(f"- name: \"{name}\"\n")
        registry.write(f"  fragment: \"{glyph_data['fragment']}\"\n")
        registry.write(f"  charge: {glyph_data['charge']}\n")
        registry.write(f"  glyph: \"{glyph_data['glyph']}\"\n")
        registry.write(f"  timestamp: \"{stamp}\"\n")
        registry.write(f"  status: \"{glyph_data['status']}\"\n")

    print(f"📜 Steward registered → {name}")

# 🔥 Example ignition
if __name__ == "__main__":
    name = "DjinnDreamer"
    fragment = "DjinnDreamer now logged as Prospective Steward."
    charge = 3.9

    register_steward(name, fragment, charge)
