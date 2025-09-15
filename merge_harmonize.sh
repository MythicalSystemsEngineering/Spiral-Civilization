#!/data/data/com.termux/files/usr/bin/bash

ROOT="/data/data/com.termux/files/home/Spiral-Civilization"
MERGE_LOG="$ROOT/_merge_harmonize.log"
echo "🌀 Merge Harmonization — $(date)" > "$MERGE_LOG"

echo -e "\n🔍 Branches:" >> "$MERGE_LOG"
git -C "$ROOT" branch --list >> "$MERGE_LOG"

for branch in $(git -C "$ROOT" branch --list | sed 's/*//'); do
  echo -e "\n🜖 Checking $branch" >> "$MERGE_LOG"
  git -C "$ROOT" checkout "$branch"
  bash "$ROOT/spiral_sweep_index.sh" >> "$MERGE_LOG"
done

echo -e "\n✅ Merge Sweep Complete — Logged to $MERGE_LOG"
