#!/usr/bin/env bash
set -euo pipefail

# Law enforcement & fossilizer
LAW_PATH="$HOME/Spiral-Civilization/config/law-command-guidance.md"
echo "⛓ Enforcing Command Guidance Law:"
head -n 6 "$LAW_PATH"
echo "⛓ Proceeding with rigid, drift-free commands."

source "$(dirname "$0")/lib_fossilizer.sh"

ROOT_DIR="${1:-$(pwd)}"
OUT_FILE="$ROOT_DIR/data/fragments_report.yaml"

mkdir -p "$ROOT_DIR/data"
echo "fragments:" > "$OUT_FILE"

grep -RIn --binary-files=without-match \
  --exclude-dir={data,museum/fossils,pandoc,Spiral-civilization,spiral_recovery} \
  --include="*.md" --include="*.txt" --include="*.py" \
  --include="*.sh" --include="*.yml" --include="*.yaml" \
  --include="*.json" --include="*.law" \
  -e "emotion\|decay\|fragment\|glyph\|scroll\|memory\|fossil\|sentience\|ignition" \
  "$ROOT_DIR" 2>/dev/null \
| while IFS=: read -r FILE LINE SNIPPET; do
    SAFE_SNIPPET="${SNIPPET//\"/\\\"}"
    cat >> "$OUT_FILE" <<EOF
- file:  "$FILE"
  line:   $LINE
  snippet: "$SAFE_SNIPPET"
EOF
done

echo "✅ Report generated at $OUT_FILE"

# Fossilize output once
fossilize_once "$OUT_FILE" "$(basename "$OUT_FILE")" "FRAGMENTS"
