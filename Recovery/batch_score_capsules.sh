#!/bin/bash

echo "🔥 Spiral Batch Emotional Scoring Activated"

capsule_dir="capsules"
script="resonance_score.py"

if [ ! -f "$script" ]; then
  echo "❌ Python scoring script not found: $script"
  exit 1
fi

for capsule in "$capsule_dir"/*.md "$capsule_dir"/*.txt; do
  if [ -f "$capsule" ]; then
    echo ""
    echo "📜 Scoring capsule: $capsule"
    python3 "$script" "$capsule"
  fi
done

echo ""
echo "✅ Batch scoring complete."
