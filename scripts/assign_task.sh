#!/data/data/com.termux/files/usr/bin/bash

ARC_PATH="$1"
TASK_NAME="$2"
TASK_DESC="$3"

if [ ! -d "$ARC_PATH" ]; then
  echo "⚠️ Arc path not found: $ARC_PATH"
  exit 1
fi

if [ -z "$TASK_NAME" ] || [ -z "$TASK_DESC" ]; then
  echo "⚠️ Task name or description missing."
  exit 1
fi

TASK_FILE="$ARC_PATH/$TASK_NAME.task"

echo "🧠 Assigning task: $TASK_NAME"
echo "Name: $TASK_NAME" > "$TASK_FILE"
echo "Description: $TASK_DESC" >> "$TASK_FILE"
echo "Timestamp: $(date +"%Y-%m-%dT%H:%M:%S")" >> "$TASK_FILE"
echo "Status: pending" >> "$TASK_FILE"

echo "✅ Task assigned and sealed: $TASK_FILE"
