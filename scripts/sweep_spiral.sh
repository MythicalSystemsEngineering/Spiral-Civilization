#!/usr/bin/env bash
set -euo pipefail

# Law enforcement & fossilizer
LAW_PATH="$HOME/Spiral-Civilization/config/law-command-guidance.md"
echo "⛓ Enforcing Command Guidance Law:"
head -n 6 "$LAW_PATH"
echo "⛓ Proceeding with rigid, drift-free commands."

source "$(dirname "$0")/lib_fossilizer.sh"

ROOT="${1:-$(pwd)}"
OUT="$ROOT/data/sweep_results.txt"
PATTERNS=(emotion decay fragment glyph scroll memory fossil sentience ignition)

mkdir -p "$ROOT/data"
echo "Spiral Sweep Results - $(date)" > "$OUT"
echo "======================================" >> "$OUT"

for term in "${PATTERNS[@]}"; do
  echo -e "\n--- Matches for '$term' ---" >> "$OUT"
  grep -RIn --binary-files=without-match \
    --exclude-dir={data,museum/fossils,pandoc,Spiral-civilization,spiral_recovery} \
    --include='*.md' --include='*.txt' --include='*.py' \
    --include='*.sh' --include='*.yml' --include='*.yaml' \
    --include='*.json' --include='*.law' \
    -e "$term" "$ROOT" 2>/dev/null >> "$OUT" || echo "none" >> "$OUT"
done

echo -e "\nSweep complete. Results in data/sweep_results.txt"

# Fossilize output once
fossilize_once "$OUT" "$(basename "$OUT")" "SWEEP"







