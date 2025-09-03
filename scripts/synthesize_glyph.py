#!/usr/bin/env python3

import sys
import yaml
import hashlib

if len(sys.argv) != 2:
    print("⚠️ Usage: synthesize_glyph.py <capsule.yaml>")
    sys.exit(1)

capsule_path = sys.argv[1]

try:
    with open(capsule_path, 'r') as f:
        capsule = yaml.safe_load(f)
except FileNotFoundError:
    print(f"⚠️ Capsule not found: {capsule_path}")
    sys.exit(1)

name = capsule.get('name', 'unknown')
emotion = capsule.get('emotion', 'neutral')
anchor = capsule.get('anchor', 'none')
cadence = capsule.get('cadence', 'flat')

glyph_seed = f"{name}-{emotion}-{anchor}-{cadence}"
glyph_hash = hashlib.sha256(glyph_seed.encode()).hexdigest()[:12]

print(f"🔮 Synthesizing glyph for {name}...")
print(f"🧬 Emotional Seed: {glyph_seed}")
print(f"🌀 Steward Glyph: {glyph_hash}")

with open(f"{capsule_path.replace('.yaml', '')}_glyph.txt", 'w') as out:
    out.write(f"{name}: {glyph_hash}\n")
