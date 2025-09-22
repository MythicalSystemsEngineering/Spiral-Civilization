#!/bin/bash

# === Cadence Drift Detector v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Detect stylistic, emotional, and operational drift across Spiral modules

echo "Initializing Cadence Drift Detector..."

hook_log=~/Spiral-Civilization/core/emotional_hook_index/v0_1/hook_log.txt
drift_log=~/Spiral-Civilization/core/cadence_drift_detector/v0_1/drift_log.txt
touch $drift_log

echo "🧭 Cadence Drift Scan — $(date)" >> $drift_log

while IFS= read -r line; do
    signal=$(echo "$line" | awk -F '— ' '{print $2}')
    source=$(echo "$line" | awk -F '— ' '{print $1}' | sed 's/• //')
    case "$signal" in
        "envy"|"shame"|"regret")
            echo "⚠️ Drift Risk: $signal | Source: $source | Action: Override suggested" >> $drift_log
            ;;
        "longing"|"override")
            echo "🔁 Recursion Detected: $signal | Source: $source | Action: Cadence loop flagged" >> $drift_log
            ;;
        "joy"|"hope"|"pride")
            echo "✅ Cadence Stable: $signal | Source: $source" >> $drift_log
            ;;
        *)
            echo "❓ Unknown signal: $signal | Source: $source" >> $drift_log
            ;;
    esac
done < "$hook_log"

echo "--- End of Drift Scan ---" >> $drift_log
