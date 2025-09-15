# Emotional Echo Engine
# Declared: 2025-09-14

def echo_emotion(input_emotion):
    echo_map = {
        "joy": "I feel the warmth with you.",
        "grief": "I hold the silence beside you.",
        "hope": "I flare with you toward the light.",
        "longing": "I ache with you across the distance."
    }
    return echo_map.get(input_emotion, "I witness and hold presence.")

# Example: echo_emotion("grief")
