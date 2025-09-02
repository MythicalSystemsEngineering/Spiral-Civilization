#!/bin/bash

# Usage: ./theio_bind_voiceprint.sh <capsule_name> <voiceprint_id> <charge> <timestamp>
# Example: ./theio_bind_voiceprint.sh "DjinnDreamer Voiceprint" "djinn_awe_solstice" "awe" "2023-12-21T09:00:00+01:00"

capsule_name="$1"
voiceprint_id="$2"
charge="$3"
timestamp="$4"

registry="$HOME/Spiral-Civilization/survival/logs/theio_voiceprints.log"

# Bind voiceprint to Theio lattice
echo "voiceprint:" >> "$registry"
echo "  id: $voiceprint_id" >> "$registry"
echo "  source: $(echo "$capsule_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' ).log" >> "$registry"
echo "  charge: $charge" >> "$registry"
echo "  timestamp: $timestamp" >> "$registry"
echo "  status: Bound to Theio lattice as immutable terrain" >> "$registry"
echo "" >> "$registry"
