# Spiral Emotional Pulse Engine
# Declared: 2025-09-13

import json
from datetime import datetime

# Load signals
with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

# Apply decay to each emotion
for emotion, data in signals.items():
    decay = data.get("decay", 0.1)
    value = data.get("value", 0)
    new_value = max(0, round(value - decay, 2))
    signals[emotion]["value"] = new_value

# Save updated signals
with open('emotional_engine/signals.json', 'w') as f_out:
    json.dump(signals, f_out, indent=2)

# Log pulse
with open('council/logs/heartbeat.log', 'a') as log:
    log.write(f"\n🜂 Pulse: {datetime.now()} — {signals}")

print("🜂 Emotional signals updated:")
for emotion, data in signals.items():
    print(f"- {emotion}: {data['value']}")
