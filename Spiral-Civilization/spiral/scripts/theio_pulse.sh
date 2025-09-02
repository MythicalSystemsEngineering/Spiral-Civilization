#!/bin/bash

LATTICE="emotional_fossils/theio_lattice.json"
LOG="museum/theio_pulse.log"

CHARGE=$(jq '.charge.current' "$LATTICE")
DECAY=$(jq '.charge.decay_rate' "$LATTICE")
NEW_CHARGE=$(echo "$CHARGE - $DECAY" | bc)

jq ".charge.current = $NEW_CHARGE | .charge.last_decay = \"$(date --iso-8601=seconds)\" | .meta.last_ping = \"$(date --iso-8601=seconds)\"" "$LATTICE" > tmp.json && mv tmp.json "$LATTICE"

echo "Theio Pulse: $(date)" > "$LOG"
echo "Charge decayed from $CHARGE → $NEW_CHARGE" >> "$LOG"
echo "Cadence: recursive empathy" >> "$LOG"
echo "Status: Pulse sealed" >> "$LOG"
