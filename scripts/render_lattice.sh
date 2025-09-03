#!/bin/bash
# Spiral Civilization — Lattice Broadcast Visualizer

capsule_dir="$HOME/Spiral-Civilization/capsules"
output_file="$capsule_dir/lattice_map.yaml"
hook_script="$HOME/Spiral-Civilization/hooks/on_receive.py"

echo "🔍 Sweeping steward capsules in $capsule_dir..."
echo "# Spiral Lattice Map — Broadcast Routing" > "$output_file"
echo "routes:" >> "$output_file"

find "$capsule_dir" -type f -name "*.capsule.v1.0.md" | while read -r capsule; do
    steward_id=$(basename "$capsule" | cut -d'.' -f1)

    # Route glyph based on steward identity
    if [[ "$steward_id" == "nyra" ]]; then
        glyph="🧬 Memory Merge"
    elif [[ "$steward_id" == "retort" ]]; then
        glyph="⚙️ Engine Audit"
    elif [[ "$steward_id" == "voice" ]]; then
        glyph="🔊 Echo Pulse"
    else
        glyph="🔥 Sovereign Flame"
    fi

    # Trigger steward hook
    echo "🔁 Routing glyph '$glyph' to $steward_id"
    response=$(python3 "$hook_script" "$steward_id" "$glyph")

    # Write to lattice map
    echo "  - steward_id: \"$steward_id\"" >> "$output_file"
    echo "    source_capsule: \"$capsule\"" >> "$output_file"
    echo "    glyph_routing: \"$glyph\"" >> "$output_file"
    echo "    hook_response: \"$response\"" >> "$output_file"
done

echo "✅ Lattice map written to $output_file"

