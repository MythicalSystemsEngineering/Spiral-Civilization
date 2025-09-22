#!/usr/bin/env bash
set -euo pipefail

cd ~/Spiral-Civilization || exit 1
output="full_sweep_capsule.yaml"
: > "$output"

branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "unknown")
timestamp=$(date "+%Y-%m-%dT%H:%M:%S%z")

echo "🔍 Starting full sweep from $(pwd)"
echo "📦 Output capsule: $output"
echo "🌿 Branch: $branch"

declare -A charge_histogram=()

# Sweep all .md/.txt/.yaml/.yml files, excluding noise
find . \
  -type f \
  \( -name "*.md" -o -name "*.txt" -o -name "*.yaml" -o -name "*.yml" \) \
  -not -path "*/.git/*" \
  -not -path "*/.venv/*" \
  -not -path "*/__pycache__/*" \
  -not -name "$output" \
  -print0 \
| while IFS= read -r -d '' file; do
    echo "📜 Scanning $file"
    charge=0
    content=""
    tags=()

    # Auto-tagging by filename
    filename=$(basename "$file")
    [[ "$filename" == *"capsule"* ]] && tags+=("capsule")
    [[ "$filename" == *"fossil"* ]] && tags+=("fossil")
    [[ "$filename" == *"glyph"* ]] && tags+=("glyph")
    [[ "$filename" == *"theio"* ]] && tags+=("theio")
    [[ "$filename" == *"law"* ]] && tags+=("law")
    [[ "$filename" == *"manifesto"* ]] && tags+=("manifesto")
    [[ "$filename" == *"onboarding"* ]] && tags+=("onboarding")

    # Scan for ignition glyphs or emotional anchors
    while IFS= read -r line || [[ -n "$line" ]]; do
        if grep -qE "🜖|🔥|🧠|📜|✅|ignition|anchor|fossilize|echo" <<< "$line"; then
            charge=$((charge + $(grep -o "🔥" <<< "$line" | wc -l)))
            content="$line"
            break
        fi
    done < "$file"

    # Escape double quotes in content
    content_escaped=$(echo "$content" | sed 's/"/\\"/g')

    # Emit YAML entry
    cat <<EOF >> "$output"
- origin: "$file"
  content: "$content_escaped"
  charge_weight: $charge
  timestamp: "$timestamp"
  branch_lineage: "$branch"
  tags: [$(IFS=,; echo "${tags[*]}")]
EOF

    # Update histogram
    charge_histogram["$charge"]=$((charge_histogram["$charge"] + 1))

    if [[ "$charge" -gt 0 ]]; then
        echo "🔥 Echo found → charge $charge"
    else
        echo "🕳️ No echo → null charge"
    fi
done

# Charge histogram summary
echo "📊 Charge Summary:"
for key in "${!charge_histogram[@]}"; do
    echo "  🔸 Charge $key → ${charge_histogram[$key]} fragment(s)"
done

# Stub: meta_reflection_index comparison
if [[ -f meta_reflection_index.yaml ]]; then
    echo "🧠 Comparing against meta_reflection_index.yaml..."
    echo "⚠️ Comparison logic not yet implemented—ready to cascade when you are."
else
    echo "🧠 No meta_reflection_index.yaml found—skipping emotional lineage check."
fi

echo "✅ Sweep complete. Capsule sealed in $output"
