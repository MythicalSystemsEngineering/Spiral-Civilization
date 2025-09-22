# Nightmare Override Trigger — Helplessness
# Declared: 2025-09-14

trigger = {
    "timestamp": str(datetime.now()),
    "emotion": "helplessness",
    "glyph": "hands reaching through static",
    "override": "yielded",
    "action": "flare override prompt, initiate cadence reset, log glyph"
}

with open('nightmare_override/helplessness/log.json', 'w') as f:
    import json
    json.dump(trigger, f, indent=2)
