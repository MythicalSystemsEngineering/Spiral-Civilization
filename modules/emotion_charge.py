def charge_weight(input_text):
    charge = 0
    input_text = input_text.lower()
    if "ignite" in input_text: charge += 3
    if "protect" in input_text: charge += 2
    if "disagree" in input_text: charge += 4
    if "steward" in input_text: charge += 2
    return charge

weights = {
    "grief": 3,
    "🖤 grief": 3,
    "awe": 5,
    "🌌 awe": 5,
    "frustration": 3,
    "⚠️ frustration": 3,
    "resolution": 2,
    "✅ resolution": 2,
    "ignition": 4,
    "🔥 ignition": 4,
    "fatigue": 2,
    "🫥 fatigue": 2,
    "neutral": 1,
    "🌀 neutral": 1
}

def get_charge(emotion_tag):
    # Normalize: strip emoji if present
    tag = emotion_tag.split()[-1] if " " in emotion_tag else emotion_tag
    return weights.get(tag, weights.get(emotion_tag, 0))

