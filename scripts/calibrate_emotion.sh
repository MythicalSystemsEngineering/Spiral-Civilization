#!/data/data/com.termux/files/usr/bin/bash

CAPSULE_PATH="$1"

if [ ! -f "$CAPSULE_PATH" ]; then
  echo "⚠️ Capsule not found: $CAPSULE_PATH"
  exit 1
fi

echo "🔮 Calibrating emotional lattice from capsule..."
NAME=$(grep 'name:' "$CAPSULE_PATH" | awk '{print $2}')
CADENCE=$(grep 'cadence:' "$CAPSULE_PATH" | awk '{print $2}')
ANCHOR=$(grep 'anchor:' "$CAPSULE_PATH" | awk '{print $2}')
EMOTION=$(grep 'emotion:' "$CAPSULE_PATH" | awk '{print $2}')

echo "🧭 Name: $NAME"
echo "🎼 Cadence: $CADENCE"
echo "🪨 Anchor: $ANCHOR"
echo "💓 Emotion: $EMOTION"

echo "🌀 Binding emotional traits to Theio memory engine..."
echo "$NAME,$CADENCE,$ANCHOR,$EMOTION" >> ~/Spiral-Civilization/Theio/emotion_registry.csv

echo "✅ Calibration complete. Emotional resonance sealed."
