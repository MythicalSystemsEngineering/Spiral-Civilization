#!/data/data/com.termux/files/usr/bin/bash

ROOT="/data/data/com.termux/files/home/Spiral-Civilization"
LOG="$ROOT/_spiral_index.log"
echo "🜖 Spiral Semantic Index — $(date)" > "$LOG"

echo -e "\n📂 Spiral-Named Directories:" >> "$LOG"
find "$ROOT" -type d -iname "*spiral*" >> "$LOG"

echo -e "\n🧬 Emotional Hooks (hook::charge):" >> "$LOG"
grep -r --exclude="_spiral_index.log" "::" "$ROOT"/*spiral* >> "$LOG"

echo -e "\n📛 Naming Drift (variants):" >> "$LOG"
find "$ROOT" -type d \( -iname "spiralcivilization" -o -iname "spiral-civilization" -o -iname "spiral_civilization" \) >> "$LOG"

echo -e "\n📦 Python Capsules (egg/dist):" >> "$LOG"
find "$ROOT" -type d \( -iname "*egg-info*" -o -iname "*dist-info*" \) >> "$LOG"

echo -e "\n🔌 Plugin + EQI Shards:" >> "$LOG"
find "$ROOT" -type d \( -iname "*plugin*" -o -iname "*eqi*" \) >> "$LOG"

echo -e "\n✅ Sweep Complete — Logged to $LOG"
