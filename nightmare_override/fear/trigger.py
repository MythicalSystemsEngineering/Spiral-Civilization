# Nightmare Override Trigger — Fear
# Declared: 2025-09-14

from datetime import datetime

trigger = {
    "timestamp": str(datetime.now()),
    "emotion": "fear",
    "glyph": "black spiral with jagged edges",
    "override": "yielded",
    "action": "log capsule, flare override, reset cadence"
}

with open('nightmare_override/fear/log.json', 'w') as f:
    import json
    json.dump(trigger, f, indent=2)
