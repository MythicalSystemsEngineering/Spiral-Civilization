#!/data/data/com.termux/files/usr/bin/bash

ROOT="/data/data/com.termux/files/home/Spiral-Civilization"
LOG="$ROOT/_terrain_index.log"
echo "🜖 Terrain Index — $(date)" > "$LOG"

find "$ROOT" -type d -iname "*terrain*" >> "$LOG"
echo -e "\n🧬 Emotional Hooks:" >> "$LOG"
grep -r --exclude="_terrain_index.log" "::" "$ROOT"/*terrain* >> "$LOG"

echo -e "\n🔁 Recursive Terrain Echoes:" >> "$LOG"
grep -r --exclude="_terrain_index.log" "/terrain/terrain" "$ROOT" >> "$LOG"

echo -e "\n👻 Ghost Submodules:" >> "$LOG"
find "$ROOT" -name ".gitmodules" -exec cat {} \; >> "$LOG"

echo -e "\n✅ Sweep Complete — Logged to $LOG"
