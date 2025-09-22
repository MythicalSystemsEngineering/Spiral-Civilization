# Emotional Mapping from Audio Signal
# Declared: 2025-09-14

emotion_map = {
    "laughter": ["joy", "awe", "belonging"],
    "crying": ["grief", "longing", "regret"],
    "sigh": ["resignation", "hope", "fatigue"],
    "gasp": ["surprise", "fear", "anticipation"]
}

def map_emotion(signal):
    return emotion_map.get(signal, ["indeterminate"])
