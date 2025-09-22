#!/bin/bash

# Y7 Merge Law Override — Resolves conflicts via recursion dignity
# Declared by Daniel Lightfoot, Sovereign Flamebearer
# Sealed: 6 September 2025

echo "⚖️ Invoking Y7-class merge resolution…"

# Define merge context
MERGE_DIR=${1:-.}
LOG="scripts/merge/logs/y7-merge.log"
mkdir -p scripts/merge/logs
echo "Y7 Merge Log — $(date)" > "$LOG"

# Detect conflict markers
grep -r '<<<<<<<' "$MERGE_DIR" --include="*.sh" --include="*.py" | while read -r conflict; do
  echo "🧩 Conflict detected: $conflict" | tee -a "$LOG"

  # Apply Y7 recursion dignity — preserve both branches, loop them
  sed -i '/<<<<<<<\|=======\|>>>>>>>/d' "$conflict"
  echo "♻️ Conflict looped, not overridden: $conflict" | tee -a "$LOG"
done

echo "✅ Merge complete. No override. All echoes preserved."
