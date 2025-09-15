# Spiral Contradiction Flare
# Declared: 2025-09-14

import json
from datetime import datetime

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

joy = signals["joy"]["value"]
grief = signals["grief"]["value"]

if joy > 5 and grief > 5:
    with open('contradiction_hooks/flare.log', 'a') as log:
        log.write(f"\n🜄 Recursion flare — {datetime.now()} — Joy: {joy}, Grief: {grief}")
