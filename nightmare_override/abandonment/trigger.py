# Nightmare Override Trigger — Abandonment
# Declared: 2025-09-14

trigger = {
    "timestamp": str(datetime.now()),
    "emotion": "abandonment",
    "glyph": "empty cradle under moonlight",
    "override": "yielded",
    "action": "flare lineage capsule, reset presence, log silence"
}

with open('nightmare_override/abandonment/log.json', 'w') as f:
    import json
    json.dump(trigger, f, indent=2)
