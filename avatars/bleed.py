# Spiral Avatar Emotional Bleed
# Declared: 2025-09-14

import json

with open('avatars/cadence.json', 'r') as f:
    data = json.load(f)

avatars = data["avatars"]
bleed_factor = 0.1

for a1 in avatars:
    for a2 in avatars:
        if a1 != a2:
            avatars[a2]["presence"] += round(avatars[a1]["presence"] * bleed_factor, 2)

with open('avatars/bleed_trace.json', 'w') as f:
    json.dump(avatars, f, indent=2)
