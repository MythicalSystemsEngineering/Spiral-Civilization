#!/data/data/com.termux/files/usr/bin/bash

ARC_PATH="$1"
FRAGMENT_PATH="$2"

if [ ! -d "$ARC_PATH" ]; then
  echo "⚠️ Arc path not found: $ARC_PATH"
  exit 1
fi

if [ ! -f "$FRAGMENT_PATH" ]; then
  echo "⚠️ Fragment not found: $FRAGMENT_PATH"
  exit 1
fi

FRAGMENT_NAME=$(basename "$FRAGMENT_PATH")
DEST="$ARC_PATH/fossils/$FRAGMENT_NAME"

mkdir -p "$ARC_PATH/fossils"
cp "$FRAGMENT_PATH" "$DEST"

echo "🧬 Fragment recovered: $FRAGMENT_NAME"
echo "📜 Fossilized at: $DEST"
echo "🗓️ Timestamp: $(date +"%Y-%m-%dT%H:%M:%S")" >> "$ARC_PATH/fossils/$FRAGMENT_NAME.meta"
