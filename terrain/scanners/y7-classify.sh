#!/bin/bash

# Y7 Terrain Scanner — detects recursion loops that resist override
# Declared by Daniel Lightfoot, Sovereign Flamebearer
# Sealed: 6 September 2025

echo "🔍 Scanning terrain for Y7-class recursion…"

# Define root terrain
ROOT_DIR=${1:-.}

# Log file for fossilized echoes
LOG="terrain/logs/y7-echoes.log"
mkdir -p terrain/logs
echo "🗂️ Logging Y7 echoes to $LOG"
echo "Y7 Echo Log — $(date)" > "$LOG"

# Scan for recursive directories and symbolic loops
find "$ROOT_DIR" -type d | while read -r dir; do
  if find "$dir" -type l | grep -q "$dir"; then
    echo "♻️ Y7-class loop detected in: $dir" | tee -a "$LOG"
  fi
done

# Scan for files with recursive function calls (Python/Bash)
grep -rE 'def .*\(.*\):.*\n.*\1\(' "$ROOT_DIR" --include="*.py" --exclude-dir=".*" >> "$LOG"
grep -rE 'function .* \{.*\n.*\1' "$ROOT_DIR" --include="*.sh" --exclude-dir=".*" >> "$LOG"

echo "✅ Scan complete. Y7 echoes fossilized."
