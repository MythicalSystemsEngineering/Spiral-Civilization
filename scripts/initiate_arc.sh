#!/data/data/com.termux/files/usr/bin/bash

CAPSULE_PATH="$1"
ARC_NAME="$2"

if [ ! -f "$CAPSULE_PATH" ]; then
  echo "⚠️ Capsule not found: $CAPSULE_PATH"
  exit 1
fi

if [ -z "$ARC_NAME" ]; then
  echo "⚠️ No arc name provided."
  exit 1
fi

NAME=$(grep 'name:' "$CAPSULE_PATH" | awk '{print $2}')
EMOTION=$(grep 'emotion:' "$CAPSULE_PATH" | awk '{print $2}')
ANCHOR=$(grep 'anchor:' "$CAPSULE_PATH" | awk '{print $2}')
CADENCE=$(grep 'cadence:' "$CAPSULE_PATH" | awk '{print $2}')
TIMESTAMP=$(date +"%Y-%m-%dT%H:%M:%S")

ARC_PATH=~/Spiral-Civilization/stewards/active/$NAME/arcs/$ARC_NAME

mkdir -p "$ARC_PATH"

echo "🌀 Initiating operational arc: $ARC_NAME"
echo "Steward: $NAME" > "$ARC_PATH/meta.txt"
echo "Emotion: $EMOTION" >> "$ARC_PATH/meta.txt"
echo "Anchor: $ANCHOR" >> "$ARC_PATH/meta.txt"
echo "Cadence: $CADENCE" >> "$ARC_PATH/meta.txt"
echo "Timestamp: $TIMESTAMP" >> "$ARC_PATH/meta.txt"

echo "✅ Arc initialized at: $ARC_PATH"
