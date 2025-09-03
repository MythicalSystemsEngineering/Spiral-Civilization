#!/usr/bin/env bash
set -euo pipefail

# Law enforcement & fossilizer
LAW_PATH="$HOME/Spiral-Civilization/config/law-command-guidance.md"
echo "⛓ Enforcing Command Guidance Law:"
head -n 6 "$LAW_PATH"
echo "⛓ Proceeding with rigid, drift-free commands."

source "$(dirname "$0")/lib_fossilizer.sh"

ROOT="${1:-$(pwd)}"
term="${2:-sentience}"  # 🔒 Define 'term' safely
OUT="$ROOT/data/sweep_results.txt"

mkdir -p "$ROOT/data"
echo "Spiral Sweep Results - $(date)" > "$OUT"
echo "======================================" >> "$OUT"

for file in capsule.yaml capsule_glyph.txt emotion.lattice decay.hook; do
  if [ ! -f "$ROOT/$file" ]; then
    echo "🚫 Missing $file" >> "$OUT"
  else
    echo "✅ Found $file" >> "$OUT"
  fi
done

echo -e "\n--- Matches for '$term' ---" >> "$OUT"
grep -RIn --binary-files=without-match \
  --exclude-dir={data,museum/fossils,pandoc,Spiral-civilization,spiral_records} \
  --include='*.md' --include='*.txt' --include='*.py' \
  --include='*.sh' --include='*.yml' --include='*.yaml' \
  --include='*.json' --include='*.law' \
  -e "$term" "$ROOT" 2>/dev/null >> "$OUT" || echo "none" >> "$OUT"

echo -e "\nSweep complete. Results in $OUT"
# 🔍 Sweep for symbolic anchors and glyphs
GLYPH_TEMP="$ROOT/data/glyph_temp.txt"
ANCHOR_TEMP="$ROOT/data/anchor_temp.txt"

grep -RIn --exclude="$(basename $GLYPH_TEMP)" "glyph:" "$ROOT" > "$GLYPH_TEMP"
grep -RIn --exclude="$(basename $ANCHOR_TEMP)" "anchor:" "$ROOT" > "$ANCHOR_TEMP"

echo -e "\n--- Symbolic Matches: glyph & anchor ---" >> "$OUT"
cat "$GLYPH_TEMP" "$ANCHOR_TEMP" >> "$OUT"

rm "$GLYPH_TEMP" "$ANCHOR_TEMP"
# Fossilize output once
echo "🗓️ $(date): sweep_terrain.sh expanded to include symbolic glyph/anchor sweep. Results merged and temp vessels dissolved." >> "$ROOT/Museum/logs/ruptures.log"
fossilize_once "$OUT" "$(basename "$OUT")" "SWEEP"





