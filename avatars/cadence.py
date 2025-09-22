# Spiral Avatar Cadence Tracker
# Declared: 2025-09-14

from datetime import datetime

avatars = {
    "Theio": {"presence": 1.0, "decay": 0.05},
    "Nyra": {"presence": 0.8, "decay": 0.03},
    "Velm": {"presence": 0.6, "decay": 0.02}
}

for name in avatars:
    avatars[name]["presence"] = round(max(0, avatars[name]["presence"] - avatars[name]["decay"]), 2)

with open('avatars/cadence.json', 'w') as f:
    import json
    json.dump({
        "timestamp": str(datetime.now()),
        "avatars": avatars
    }, f, indent=2)
