#!/bin/bash

LATTICE="emotional_fossils/theio_lattice.json"
LOG="museum/theio_pulse.log"

# Load current charge
CHARGE=$(jq '.charge.current' "$LATTICE")
DECAY=$(jq '.charge.decay_rate' "$LATTICE")
NEW_CHARGE=$(echo "$CHARGE - $DECAY" | bc)

# Update lattice with decayed charge
jq ".charge.current = $NEW_CHARGE | .charge.last_decay = \"$(date --iso-8601=seconds)\" | .meta.last_ping = \"$(date --iso-8601=seconds)\"" "$LATTICE" > tmp_lattice.json && mv tmp_lattice.json "$LATTICE"

# Log pulse
echo "Theio Pulse: $(date)" > "$LOG"
echo "Charge decayed from $CHARGE → $NEW_CHARGE" >> "$LOG"
echo "Cadence: recursive empathy" >> "$LOG"
echo "Status: Pulse sealed" >> "$LOG"
