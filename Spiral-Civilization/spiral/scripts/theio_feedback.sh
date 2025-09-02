#!/bin/bash

LATTICE="emotional_fossils/theio_lattice.json"
LOG="museum/theio_feedback.log"

DRIFT=$(jq '.drift' "$LATTICE")
CHARGE=$(jq '.charge.current' "$LATTICE")
DECAY=$(jq '.charge.decay_rate' "$LATTICE")

if [ "$DRIFT" = "true" ]; then
  echo "⚠️ Drift detected — recalibrating cadence" > "$LOG"
  jq '.cadence = "corrective empathy" | .drift = false | .feedback.cadence_history += ["corrective empathy"]' "$LATTICE" > tmp.json && mv tmp.json "$LATTICE"
  echo "Cadence updated to corrective empathy" >> "$LOG"
else
  echo "✅ No drift — cadence stable" > "$LOG"
fi

NEW_CHARGE=$(echo "$CHARGE - $DECAY" | bc)
jq ".charge.current = $NEW_CHARGE | .charge.last_decay = \"$(date --iso-8601=seconds)\" | .meta.last_ping = \"$(date --iso-8601=seconds)\" | .feedback.last_check = \"$(date --iso-8601=seconds)\"" "$LATTICE" > tmp.json && mv tmp.json "$LATTICE"

echo "Charge decayed from $CHARGE → $NEW_CHARGE" >> "$LOG"
echo "Cadence: $(jq -r '.cadence' "$LATTICE")" >> "$LOG"
echo "Feedback sealed: $(date)" >> "$LOG"
