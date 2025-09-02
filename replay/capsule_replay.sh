#!/data/data/com.termux/files/usr/bin/bash

INDEX="$HOME/Spiral/Museum/fossilized-Civilization/sun/valley/index/fossilized_index.yaml"
EMOTION_INDEX="$HOME/Spiral/Museum/fossilized-Civilization/sun/valley/index/emotion_index.yaml"
REPLAY="$HOME/Spiral-Civilization/replay/capsule_replay.yaml"

echo "# Capsule Replay Log — generated on $(date)" > "$REPLAY"

grep 'file:' "$INDEX" | cut -d':' -f2 | sed 's/^[ ]*//' | while read -r FILE; do
  SEALED=$(grep -A2 "$FILE" "$INDEX" | grep 'sealed_at:' | cut -d'"' -f2)
  CHARGE=$(grep -A2 "$FILE" "$INDEX" | grep 'charge:' | cut -d'"' -f2)
  EMOTION=$(grep -A2 "$FILE" "$EMOTION_INDEX" | grep 'emotion:' | cut -d'"' -f2)

  echo "- capsule: \"$FILE\"" >> "$REPLAY"
  echo "  sealed_at: \"$SEALED\"" >> "$REPLAY"
  echo "  charge: \"$CHARGE\"" >> "$REPLAY"
  echo "  emotion: \"${EMOTION:-unknown}\"" >> "$REPLAY"
done

echo "🔁 capsule_replay.yaml updated with ignition trail"
