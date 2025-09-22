# Spiral Cadence Distortion
# Declared: 2025-09-14

import json
from datetime import datetime

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

distortion = sum([signals[e]["value"] for e in signals if signals[e]["value"] > 7])
cadence_shift = round(distortion * 0.05, 2)

with open('cadence/distortion.log', 'a') as log:
    log.write(f"\n🜂 Cadence distorted — {datetime.now()} — Shift: {cadence_shift}")
