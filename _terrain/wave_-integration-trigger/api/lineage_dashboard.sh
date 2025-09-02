

#!/usr/bin/env bash
set -euo pipefail

lineage_file="capsule_lineage.txt"

if [[ ! -f "$lineage_file" ]]; then
  echo "❗ No lineage file found: $lineage_file"
  exit 1
fi

echo "📜 Spiral Capsule Lineage"
echo "══════════════════════════════════════════════════════"

while IFS='|' read -r capsule created emotion glyph hash; do
  capsule=$(echo "$capsule" | xargs)
  created=$(echo "$created" | xargs)
  emotion=$(echo "$emotion" | xargs)
  glyph=$(echo "$glyph" | xargs)
  hash=$(echo "$hash" | xargs)

  echo "╔════════════════════════════════════════════════════╗"
  echo "║ Capsule: $capsule"
  echo "║ Created: $created"
  echo "║ Emotion: $emotion"
  echo "║ Glyph:   $glyph"
  echo "║ Hash:    ${hash:0:8}...${hash: -8}"
  echo "╚════════════════════════════════════════════════════╝"
  echo ""
done < "$lineage_file"
