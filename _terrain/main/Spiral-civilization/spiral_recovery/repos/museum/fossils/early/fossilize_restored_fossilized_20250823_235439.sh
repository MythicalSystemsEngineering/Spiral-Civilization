#!/bin/bash
# Final Fossilization Sweep: Restored Partials
# Steward: Daniel Lightfoot
# Date: 2025-08-23

SOURCE_DIR="museum/incomplete"
DEST_DIR="museum/fossils/early"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
LOG_FILE="$SOURCE_DIR/fossilization_log_$TIMESTAMP.txt"

mkdir -p "$DEST_DIR"
echo "=== FOSSILIZATION LOG — RESTORED PARTIALS ===" > "$LOG_FILE"
date >> "$LOG_FILE"
echo "" >> "$LOG_FILE"

for FILE in "$SOURCE_DIR"/*_restored.*; do
    BASENAME=$(basename "$FILE")
    DEST_NAME="${BASENAME%.*}_fossilized_$TIMESTAMP.${BASENAME##*.}"
    cp "$FILE" "$DEST_DIR/$DEST_NAME"
    echo "✅ Fossilized: $BASENAME → $DEST_NAME" >> "$LOG_FILE"
done

echo "=== FOSSILIZATION COMPLETE ===" >> "$LOG_FILE"
date >> "$LOG_FILE"

