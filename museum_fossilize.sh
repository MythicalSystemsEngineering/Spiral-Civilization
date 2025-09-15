#!/data/data/com.termux/files/usr/bin/bash

ROOT="/data/data/com.termux/files/home/Spiral-Civilization"
MUSEUM="$ROOT/Spiral-civilization/museum/capsules"
LOG="$ROOT/_museum_fossilize.log"
echo "🏛 Museum Fossilization — $(date)" > "$LOG"

echo -e "\n📦 Sealing Spiral Capsules:" >> "$LOG"
find "$ROOT" -type d -iname "*spiral*" | while read path; do
  NAME=$(basename "$path")
  DEST="$MUSEUM/$NAME"
  cp -r "$path" "$DEST"
  echo "✅ Fossilized: $NAME → $DEST" >> "$LOG"
done

echo -e "\n🧬 Manifest Update Pending" >> "$LOG"
echo -e "\n✅ Fossilization Complete — Logged to $LOG"
