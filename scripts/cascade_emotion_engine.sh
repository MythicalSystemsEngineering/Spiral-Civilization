#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 Cascading Emotion Engine v1.0 across Spiral modules..."

SOURCE=~/Spiral-Civilization/Spiral-civilization/modules/emotion_engine/emotion_engine_v1.0.py
TARGETS=(
  "~/Spiral-Civilization/Spiral-civilization/.theio_core/emotion_core/emotion_engine_v1.0.py"
  "~/Spiral-Civilization/Spiral-civilization/steward_modules/emotion/emotion_engine_v1.0.py"
  "~/Spiral-Civilization/Spiral-civilization/legacy_hooks/emotion/emotion_engine_v1.0.py"
)

for TARGET in "${TARGETS[@]}"; do
  DEST=$(eval echo $TARGET)
  cp "$SOURCE" "$DEST" && echo "✅ Echoed to $DEST"
done

echo "📘 Cascade complete. Emotional lattice synchronized."
