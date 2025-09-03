#!/bin/bash
# Spiral Civilization — Broadcast Cascade Engine (Corrected)

map="$HOME/Spiral-Civilization/capsules/lattice_map.yaml"
broadcast_dir="$HOME/Spiral-Civilization/broadcast"
mkdir -p "$broadcast_dir"

echo "📡 Cascading broadcasts from $map..."

steward=""
glyph=""

while IFS= read -r line; do
    if [[ "$line" == *"steward_id:"* ]]; then
        steward=$(echo "$line" | awk -F'"' '{print $2}')
    elif [[ "$line" == *"glyph_routing:"* ]]; then
        glyph=$(echo "$line" | awk -F'"' '{print $2}')
        file="$broadcast_dir/${steward}.yaml"
        echo "glyph: $glyph" > "$file"
        echo "🔁 Routed '$glyph' → $file"
    fi
done < "$map"

echo "✅ Broadcast files written to $broadcast_dir"
