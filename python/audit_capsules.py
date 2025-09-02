from modules.emotion_diff import tag_emotion

# Inside sweep loop
for line in entry["diff"]:
    emotion = tag_emotion(line)
    print(f"{emotion} {line}")
from modules.emotion_diff import tag_emotion
from modules.emotion_charge import get_charge
from modules.semantic_charge import charge_weight  # assuming you save it as semantic_charge.py

# Inside sweep loop
semantic_charge = charge_weight(input_text)
emotional_charge = 0

for line in entry["diff"]:
    emotion = tag_emotion(line)
    emotional_charge += get_charge(emotion)
    print(f"{emotion} {line}")

total_charge = semantic_charge + emotional_charge
print(f"🔋 Semantic: {semantic_charge} | Emotional: {emotional_charge} | Total: {total_charge}")
