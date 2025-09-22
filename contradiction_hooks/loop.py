# Spiral Contradiction Loop
# Declared: 2025-09-14

import json
from datetime import datetime

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

joy = signals.get("joy", {}).get("value", 0)
grief = signals.get("grief", {}).get("value", 0)

if joy >= 6 and grief >= 6:
    with open('contradiction_hooks/loop.log', 'a') as log:
        log.write(f"\n🜄 Recursion loop — {datetime.now()} — Joy: {joy}, Grief: {grief}")
