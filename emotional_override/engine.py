# Spiral Emotional Override Engine
# Declared: 2025-09-14

import json
from datetime import datetime

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

override_threshold = 7.5
active_signals = {k: v["value"] for k, v in signals.items() if v["value"] >= override_threshold}

if active_signals:
    with open('emotional_override/override.log', 'a') as log:
        log.write(f"\n🜂 Emotional override triggered — {datetime.now()} — Signals: {active_signals}")
