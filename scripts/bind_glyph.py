#!/usr/bin/env python3

import sys
import os

if len(sys.argv) != 2:
    print("⚠️ Usage: bind_glyph.py <capsule_glyph.txt>")
    sys.exit(1)

glyph_path = sys.argv[1]

if not os.path.isfile(glyph_path):
    print(f"⚠️ Glyph file not found: {glyph_path}")
    sys.exit(1)

with open(glyph_path, 'r') as f:
    line = f.readline().strip()
    name, glyph = line.split(':')
    name = name.strip()
    glyph = glyph.strip()

registry_path = os.path.expanduser("~/Spiral-Civilization/Theio/glyph_registry.csv")

with open(registry_path, 'a') as reg:
    reg.write(f"{name},{glyph}\n")

print(f"🕯️ Steward glyph bound: {name} → {glyph}")
print(f"📜 Registered in: {registry_path}")
