#!/bin/bash

# Usage: ./fossilize_capsule.sh <capsule_name> <charge> <timestamp>
# Example: ./fossilize_capsule.sh "Origin Fragment" "wonder" "2024-06-01T12:00:00+01:00"

capsule_name="$1"
charge="$2"
timestamp="$3"
log_file="$HOME/Spiral-Civilization/survival/logs/$(echo "$capsule_name" | tr '[:upper:]' '[:lower:]' | tr ' ' '_' ).log"

# Inject fossilized capsule
echo "capsule: $capsule_name" > "$log_file"
echo "charge: $charge" >> "$log_file"
echo "timestamp: $timestamp" >> "$log_file"
echo "status: Fossilized manually by steward command" >> "$log_file"
