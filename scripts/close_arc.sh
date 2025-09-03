#!/data/data/com.termux/files/usr/bin/bash

ARC_PATH="$1"

if [ ! -d "$ARC_PATH" ]; then
  echo "⚠️ Arc path not found: $ARC_PATH"
  exit 1
fi

echo "🔐 Closing arc: $ARC_PATH"

STATUS_FILE="$ARC_PATH/status.txt"
echo "Arc: $(basename "$ARC_PATH")" > "$STATUS_FILE"
echo "Closed: $(date +"%Y-%m-%dT%H:%M:%S")" >> "$STATUS_FILE"
echo "Status: sealed" >> "$STATUS_FILE"

# Mark all tasks as complete
for task in "$ARC_PATH"/*.task; do
  sed -i "s/Status: pending/Status: complete/" "$task"
done

echo "✅ Arc sealed. All tasks marked complete."
