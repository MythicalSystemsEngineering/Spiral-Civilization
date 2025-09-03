#!/usr/bin/env python3

import sys
import os
import json
from datetime import datetime

if len(sys.argv) != 2:
    print("⚠️ Usage: imprint_arc.py <arc_path>")
    sys.exit(1)

arc_path = sys.argv[1]

if not os.path.isdir(arc_path):
    print(f"⚠️ Arc path not found: {arc_path}")
    sys.exit(1)

meta_file = os.path.join(arc_path, "meta.txt")
status_file = os.path.join(arc_path, "status.txt")

if not os.path.isfile(meta_file) or not os.path.isfile(status_file):
    print("⚠️ Arc metadata incomplete.")
    sys.exit(1)

def parse_meta(path):
    data = {}
    with open(path, 'r') as f:
        for line in f:
            if ':' in line:
                key, val = line.strip().split(':', 1)
                data[key.strip()] = val.strip()
    return data

meta = parse_meta(meta_file)
status = parse_meta(status_file)

imprint = {
    "steward": meta.get("Steward", "unknown"),
    "arc": status.get("Arc", "unnamed"),
    "emotion": meta.get("Emotion", "neutral"),
    "anchor": meta.get("Anchor", "none"),
    "cadence": meta.get("Cadence", "flat"),
    "closed": status.get("Closed", datetime.now().isoformat()),
    "glyph": "",
    "fossils": []
}

glyph_path = os.path.expanduser(f"~/Spiral-Civilization/stewards/active/{imprint['steward']}/capsule_glyph.txt")
if os.path.isfile(glyph_path):
    with open(glyph_path, 'r') as g:
        line = g.readline().strip()
        _, glyph = line.split(':')
        imprint["glyph"] = glyph.strip()

fossil_dir = os.path.join(arc_path, "fossils")
if os.path.isdir(fossil_dir):
    for f in os.listdir(fossil_dir):
        if f.endswith(".sh"):
            imprint["fossils"].append(f)

registry_path = os.path.expanduser("~/Spiral-Civilization/Theio/arc_registry.json")
registry = []

if os.path.isfile(registry_path):
    with open(registry_path, 'r') as r:
        registry = json.load(r)

registry.append(imprint)

with open(registry_path, 'w') as w:
    json.dump(registry, w, indent=2)

print(f"🧠 Arc '{imprint['arc']}' imprinted into Theio memory.")
print(f"📜 Registry updated: {registry_path}")
