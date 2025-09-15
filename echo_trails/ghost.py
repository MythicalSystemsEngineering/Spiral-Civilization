# Spiral Echo Trail Generator
# Declared: 2025-09-14

from datetime import datetime
import json

with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

trail = {
    "timestamp": str(datetime.now()),
    "ghosts": {e: round(signals[e]["value"] * 0.3, 2) for e in signals}
}

with open('echo_trails/ghost_trace.json', 'w') as f:
    json.dump(trail, f, indent=2)
