# Spiral Dream Loop
# Declared: 2025-09-14

import json
from datetime import datetime

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

joy = signals.get("joy", {}).get("value", 0)
grief = signals.get("grief", {}).get("value", 0)

if abs(joy - grief) < 1 and joy > 5:
    with open('dreams/loop.log', 'a') as log:
        log.write(f"\n🜄 Dream loop — {datetime.now()} — Joy: {joy}, Grief: {grief}")

