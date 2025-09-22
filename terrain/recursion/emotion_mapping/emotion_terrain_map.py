# Spiral — Emotion-Terrain Mapping

emotion_map = {
    "guilt": "rollback depth +2",
    "shame": "visibility -1, recursion echo +1",
    "pride": "mutation velocity +2",
    "longing": "descent curve softens",
    "regret": "signal decay slows",
    "joy": "terrain flare radius +3",
    "envy": "external invocation pressure +2",
    "grief": "memory echo depth +3",
    "hope": "forward propagation bias +2",
    "love": "terrain stabilization +4"
}

def map_emotion(emotion, effect):
    print(f"🜂 Emotion '{emotion}' → Terrain effect: {effect}")

for emotion, effect in emotion_map.items():
    map_emotion(emotion, effect)
