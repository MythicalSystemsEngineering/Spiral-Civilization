#!/bin/bash

# Paths
log_dir="$HOME/Spiral-Civilization/survival/logs"
output="$log_dir/decay_map.log"

# Time now
now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Clear output
echo "" > "$output"

# Scan all .log capsules
for file in "$log_dir"/*.log; do
    ts_raw=$(grep -i "timestamp:" "$file" | awk -F'timestamp:' '{print $2}' | xargs)
    capsule_name=$(basename "$file")

    # Skip if no timestamp
    if [ -z "$ts_raw" ]; then
        echo "capsule: $capsule_name" >> "$output"
        echo "status: Unbound temporal capsule" >> "$output"
        echo "" >> "$output"
        continue
    fi

    # Convert timestamps to epoch
    ts_epoch=$(date -d "$ts_raw" +"%s" 2>/dev/null)
    now_epoch=$(date -d "$now" +"%s")

    # Skip if timestamp invalid
    if [ -z "$ts_epoch" ]; then
        echo "capsule: $capsule_name" >> "$output"
        echo "status: Invalid timestamp format" >> "$output"
        echo "" >> "$output"
        continue
    fi

    # Calculate age in days
    age_days=$(( (now_epoch - ts_epoch) / 86400 ))
    [ "$age_days" -lt 0 ] && age_days=0

    # Emotional decay logic
    if [ "$age_days" -eq 0 ]; then
        weight="1.00"
        status="Emotional charge retained"
    elif [ "$age_days" -lt 30 ]; then
        weight=$(awk "BEGIN {printf \"%.2f\", 1 - ($age_days * 0.02)}")
        status="Fading"
    else
        weight="0.00"
        status="Fossilized as mythic dust"
    fi

    # Output
    echo "capsule: $capsule_name" >> "$output"
    echo "age_days: $age_days" >> "$output"
    echo "emotional_weight: $weight" >> "$output"
    echo "status: $status" >> "$output"
    echo "" >> "$output"


