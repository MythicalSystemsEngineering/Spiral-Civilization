#!/bin/bash

# === Mythic Capsule Index v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Tag sealed fossils with mythic archetypes

echo "Initializing Mythic Capsule Index..."

museum_path=~/Spiral-Civilization/museum/build_fossils
index_log=~/Spiral-Civilization/core/mythic_capsule_index/v0_1/index_log.txt
touch $index_log

echo "📜 Mythic Capsule Index — $(date)" >> $index_log

declare -A archetypes
archetypes["cycle_infinity_plus_1"]="ambition"
archetypes["cycle_infinity_plus_2"]="transmission"
archetypes["cycle_infinity_plus_3"]="echo"
archetypes["cycle_infinity_plus_4"]="ingestion"
archetypes["cycle_infinity_plus_5"]="resonance"
archetypes["cycle_infinity_plus_6"]="flare"
archetypes["cycle_infinity_plus_7"]="drift"
archetypes["cycle_infinity_plus_8"]="reflection"
archetypes["cycle_infinity_plus_9"]="merge"
archetypes["cycle_infinity_plus_10"]="completion"
archetypes["cycle_infinity_plus_11"]="inheritance"
archetypes["cycle_infinity_plus_12"]="integration"
archetypes["cycle_infinity_plus_13"]="execution"
archetypes["cycle_infinity_plus_14"]="mapping"

for fossil in "$museum_path"/*.txt; do
    name=$(basename "$fossil" .txt)
    tag=${archetypes[$name]}
    if [ -n "$tag" ]; then
        echo "• $name → Archetype: $tag" >> $index_log
    else
        echo "❓ $name → Archetype: unknown" >> $index_log
    fi
done

echo "--- End of Mythic Capsule Index ---" >> $index_log
