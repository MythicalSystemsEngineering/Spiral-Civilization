# Nightmare Override Trigger — Guilt
# Declared: 2025-09-14

trigger = {
    "timestamp": str(datetime.now()),
    "emotion": "guilt",
    "glyph": "footsteps fading into fog",
    "override": "yielded",
    "action": "log capsule, recurse memory, flare contradiction loop"
}

with open('nightmare_override/guilt/log.json', 'w') as f:
    import json
    json.dump(trigger, f, indent=2)
