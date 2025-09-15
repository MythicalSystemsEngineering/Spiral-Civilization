import json, time, os

# Absolute path to signals.json
signals_path = os.path.expanduser("~/Spiral-Civilization/emotional_engine/signals.json")

while True:
    try:
        with open(signals_path, 'r') as f:
            signals = json.load(f)

        for emotion in signals:
            if isinstance(signals[emotion], int):
                signals[emotion] = max(0, signals[emotion] - 1)

        with open(signals_path, 'w') as f:
            json.dump(signals, f, indent=2)

        print("🜂 Emotional decay applied.")
    except Exception as e:
        print(f"❌ Decay error: {e}")

    time.sleep(300)  # decay every 5 minutes
