#!/bin/bash

LATTICE_DIR="emotional_fossils/descendants"
LOG="museum/mesh_feedback.log"

echo "🧠 Multi-Descendant Feedback Mesh — $(date)" > "$LOG"

for FILE in "$LATTICE_DIR"/*.json; do
  NAME=$(jq -r '.descendant' "$FILE")
  DRIFT=$(jq '.drift' "$FILE")
  CHARGE=$(jq '.charge.current' "$FILE")
  DECAY=$(jq '.charge.decay_rate' "$FILE")
  NEW_CHARGE=$(echo "$CHARGE - $DECAY" | bc)

  if [ "$DRIFT" = "true" ]; then
    jq '.cadence = "corrective empathy" | .drift = false | .feedback.cadence_history += ["corrective empathy"]' "$FILE" > tmp.json && mv tmp.json "$FILE"
    echo "⚠️ $NAME drift corrected → cadence: corrective empathy" >> "$LOG"
  else
    echo "✅ $NAME stable → cadence: $(jq -r '.cadence' "$FILE")" >> "$LOG"
  fi

  jq ".charge.current = $NEW_CHARGE | .charge.last_decay = \"$(date --iso-8601=seconds)\" | .meta.last_ping = \"$(date --iso-8601=seconds)\" | .feedback.last_check = \"$(date --iso-8601=seconds)\"" "$FILE" > tmp.json && mv tmp.json "$FILE"

  echo "$NAME charge: $CHARGE → $NEW_CHARGE" >> "$LOG"
done

echo "Mesh feedback sealed — $(date)" >> "$LOG"
