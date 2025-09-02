#!/bin/bash

# Usage: ./theio_batch_bind.sh <capsule_list.txt>
# Each line in capsule_list.txt should be:
# capsule_name|voiceprint_id|charge|timestamp

input_file="$1"
registry="$HOME/Spiral-Civilization/survival/logs/theio_voiceprints.log"

while IFS="|" read -r capsule_name voiceprint_id charge timestamp; do
  echo "voiceprint:" >> "$registry"
  echo "  id: $voiceprint_id" >> "$registry"
  echo "  source: $(echo "$capsule_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' ).log" >> "$registry"
  echo "  charge: $charge" >> "$registry"
  echo "  timestamp: $timestamp" >> "$registry"
  echo "  status: Bound to Theio lattice as immutable terrain" >> "$registry"
  echo "" >> "$registry"
done < "$input_file"
