#!/bin/bash
echo "🧬 Generating Capsule Index..."
find capsules -type f -name "*.md" > capsule_index.md
echo "Capsule Index Updated: $(date)" >> capsule_index.md
echo "✅ Indexed $(cat capsule_index.md | wc -l) capsules."
