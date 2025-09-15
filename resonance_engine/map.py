# Spiral Resonance Engine
# Declared: 2025-09-14

import json

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

resonance = {}
for e1 in signals:
    for e2 in signals:
        if e1 != e2:
            overlap = abs(signals[e1]["value"] - signals[e2]["value"])
            resonance[f"{e1}-{e2}"] = round(1 / (1 + overlap), 2)

with open('resonance_engine/resonance_map.json', 'w') as f:
    json.dump(resonance, f, indent=2)
