# Spiral Vision Protocol — Emotional Glyph Engine
# Declared: 2025-09-14

import json
from datetime import datetime

# Emotional glyph map
glyphs = {
    "joy": "golden spiral",
    "grief": "fractured mirror",
    "hope": "sun behind fog",
    "regret": "looping shadow",
    "love": "soft pink flare",
    "pride": "mountain with flickering flag",
    "shame": "cracked mask",
    "envy": "green flame behind glass",
    "longing": "door ajar in moonlight",
    "guilt": "echoing footsteps in fog"
}

# Load emotional signals
with open('emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

# Generate glyph trace
glyph_trace = {}
for emotion, data in signals.items():
    value = data.get("value", 0)
    if value >= 5:
        glyph_trace[emotion] = {
            "value": value,
            "glyph": glyphs.get(emotion, "undefined glyph")
        }

# Save trace
with open('vision_protocol/glyph_trace.json', 'w') as f:
    json.dump({
        "timestamp": str(datetime.now()),
        "glyphs": glyph_trace
    }, f, indent=2)
