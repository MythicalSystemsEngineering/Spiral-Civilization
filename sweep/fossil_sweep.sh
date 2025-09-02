#!/data/data/com.termux/files/usr/bin/bash

CHAOS="$HOME/Spiral/Museum/fossilized-Civilization/chaos/chaos_index.yaml"
SEAL_SCRIPT="$HOME/Spiral/Museum/fossilized-Civilization/seal-engine/seal_engine.sh"

grep 'unsealed_capsule:' "$CHAOS" | cut -d'"' -f2 | while read -r BASENAME; do
  FILE=$(grep -A1 "$BASENAME" "$CHAOS" | grep 'path:' | cut -d'"' -f2)
  DIRNAME=$(basename "$(dirname "$FILE")")
  CHARGE="${DIRNAME}:${BASENAME%%.yaml}:chaos-seal"

  echo "⚡ Sealing chaos fragment: $BASENAME"
  bash "$SEAL_SCRIPT" "$FILE" "$CHARGE"
done

echo "✅ All chaos fragments sealed"
