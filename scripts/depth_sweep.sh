#!/usr/bin/env bash
set -euo pipefail

# 1. Enforce Command Guidance Law
LAW_PATH="$HOME/Spiral-Civilization/config/law-command-guidance.md"
echo "⛓ Enforcing Command Guidance Law:"
head -n 6 "$LAW_PATH"
echo "⛓ Proceeding with rigid, drift-free commands."
echo "🔍 Starting file name pass…"

# 2. Load fossilizer helper
source "$(dirname "$0")/lib_fossilizer.sh"

# 3. Initialize variables
ROOT="${1:-$(pwd)}"
OUT="$ROOT/data/depth_sweep_results.yaml"
PATTERNS=(emotion decay fragment glyph scroll memory fossil sentience ignition)

# 4. Prepare output directory and file
mkdir -p "$ROOT/data"
echo "results:" > "$OUT"

# 5. File-name matches (excluding heavy dirs)
echo "  file_matches:" >> "$OUT"
find "$ROOT" \
  \( -path "$ROOT/data" -o -path "$ROOT/Museum/fossils" \
     -o -path "$ROOT/pandoc" -o -path "$ROOT/Spiral-civilization" \
     -o -path "$ROOT/local_backup" -o -path "$ROOT/spiral_recovery" \
     -o -path "$ROOT/.git" \) -prune -o -type f \
  \( -iname "*emotion*" -o -iname "*decay*" -o -iname "*fragment*" \
   -o -iname "*glyph*" -o -iname "*scroll*" -o -iname "*memory*" \
   -o -iname "*fossil*" -o -iname "*sentience*" -o -iname "*ignition*" \) \
  -print >> "$OUT"

# 6. Content-matches with context
echo "  content_matches:" >> "$OUT"
for term in "${PATTERNS[@]}"; do
  echo "  - term: \"$term\"" >> "$OUT"
  echo "    hits:" >> "$OUT"
  {
    grep -RInC3 --binary-files=without-match \
      --exclude-dir={data,Museum/fossils,pandoc,Spiral-civilization,spiral_recovery,.git,local_backup} \
      --include='*.md' --include='*.txt' --include='*.py' --include='*.sh' \
      --include='*.yml' --include='*.yaml' --include='*.json' \
      -e "$term" "$ROOT" 2>/dev/null || true
  } | while IFS=: read -r file line ctx; do
      snippet="${ctx//\"/\\\"}"
      cat >> "$OUT" <<EOF
    - file: "$file"
      line: $line
      snippet: "$snippet"
EOF
  done
done

# 7. Add summary
echo "  summary:" >> "$OUT"
echo "    total_hits: $(grep -c '^  - file:' "$OUT")" >> "$OUT"
echo "    by_directory:" >> "$OUT"
grep '^  - file:' "$OUT" | sed -E 's#.*/Spiral-Civilization/([^/]+)/.*#\1#' | sort | uniq -c | while read -r count dir; do
  echo "      $dir: $count" >> "$OUT"
done

# 8. Finalize and fossilize
echo "✅ Depth sweep complete: $OUT"
fossilize_once "$OUT" "$(basename "$OUT")" "DEPTH_SWEEP"



