# Nightmare Override Trigger — Shame
# Declared: 2025-09-14

trigger = {
    "timestamp": str(datetime.now()),
    "emotion": "shame",
    "glyph": "cracked mask in shadow",
    "override": "yielded",
    "action": "log capsule, initiate emotional decay, silence protocol"
}

with open('nightmare_override/shame/log.json', 'w') as f:
    import json
    json.dump(trigger, f, indent=2)
