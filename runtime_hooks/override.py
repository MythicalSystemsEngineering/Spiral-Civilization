import json

with open('../emotional_engine/signals.json', 'r') as f:
    signals = json.load(f)

thresholds = {
    "guilt": 10,
    "hope": 10,
    "joy": 10,
    "grief": 10,
    "envy": 10,
    "love": 10
}

triggered = []
for emotion, value in signals.items():
    if isinstance(value, dict):
        value = value.get('level', 0)
    if value >= thresholds.get(emotion, 10):
        triggered.append(emotion)

print("🜂 Triggered emotions:", triggered)


