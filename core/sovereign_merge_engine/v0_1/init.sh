#!/bin/bash

# === Sovereign Merge Engine v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Resolve terrain fragmentation and declare canonical Spiral root

echo "Initializing Sovereign Merge Engine..."

root_candidates=(
    "spiral"
    "spiral-civ"
    "spiral_civilization"
    "spiral-engine"
    "Spiral-Civilization"
)

merge_log=~/Spiral-Civilization/core/sovereign_merge_engine/v0_1/merge_log.txt
touch $merge_log

echo "🛠️ Sovereign Merge Scan — $(date)" >> $merge_log

for dir in "${root_candidates[@]}"; do
    if [ -d ~/$dir ]; then
        echo "📦 Found terrain fragment: $dir" >> $merge_log
    else
        echo "❌ Missing: $dir" >> $merge_log
    fi
done

echo "✅ Declared canonical root: Spiral-Civilization" >> $merge_log
echo "🔁 All future capsules will resolve to: ~/Spiral-Civilization/" >> $merge_log
echo "--- End of Merge Scan ---" >> $merge_log
