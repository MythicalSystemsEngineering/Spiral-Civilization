#!/bin/bash
# Restoration & Fossilization Engine: Spiral Early Era
# Steward: Daniel Lightfoot
# Date: 2025-08-23

MANIFEST="spiral_recovery/manifests/early_era_sorting.yml"
ARCHIVE_DIR="museum/fossils/early"
INCOMPLETE_DIR="museum/incomplete"
DUPLICATE_DIR="museum/fossils/duplicates"
OFFTOPIC_DIR="museum/off_topic"
RESTORE_LOG="spiral_recovery/restore_log.txt"

mkdir -p "$ARCHIVE_DIR" "$INCOMPLETE_DIR" "$DUPLICATE_DIR" "$OFFTOPIC_DIR"
echo "=== SPIRAL RESTORATION LOG ===" > "$RESTORE_LOG"
date >> "$RESTORE_LOG"
echo "" >> "$RESTORE_LOG"

# Parse YAML manually (lightweight)
grep -E 'filename:|location:|status:|action:' "$MANIFEST" | while read -r line; do
    case "$line" in
        filename:*) FILE=$(echo "$line" | cut -d':' -f2 | xargs) ;;
        location:*) LOC=$(echo "$line" | cut -d':' -f2 | xargs) ;;
        status:*) STATUS=$(echo "$line" | cut -d':' -f2 | xargs) ;;
        action:*)
            ACTION=$(echo "$line" | cut -d':' -f2 | xargs)
            echo "[Processing] $FILE ($STATUS)" >> "$RESTORE_LOG"

            case "$ACTION" in
                fossilize)
                    cp "$LOC/$FILE" "$ARCHIVE_DIR/${FILE%.*}_$(date +"%Y%m%d_%H%M%S").${FILE##*.}"
                    echo "✅ Fossilized: $FILE" >> "$RESTORE_LOG"
                    ;;
                restore_and_fossilize)
                    cp "$LOC/$FILE" "$INCOMPLETE_DIR/${FILE%.*}_restored.${FILE##*.}"
                    echo "⚙ Restoration needed: $FILE → moved to incomplete" >> "$RESTORE_LOG"
                    ;;
                archive_in_duplicates)
                    cp "$LOC/$FILE" "$DUPLICATE_DIR/$FILE"
                    echo "📁 Archived duplicate: $FILE" >> "$RESTORE_LOG"
                    ;;
                archive_off_topic)
                    cp "$LOC/$FILE" "$OFFTOPIC_DIR/$FILE"
                    echo "📁 Archived off-topic: $FILE" >> "$RESTORE_LOG"
                    ;;
                preserve_as_reference)
                    cp "$LOC/$FILE" "$ARCHIVE_DIR/${FILE%.*}_reference.${FILE##*.}"
                    echo "📌 Preserved reference: $FILE" >> "$RESTORE_LOG"
                    ;;
                *)
                    echo "❓ Unknown action: $ACTION" >> "$RESTORE_LOG"
                    ;;
            esac
            echo "" >> "$RESTORE_LOG"
            ;;
    esac
done

echo "=== RESTORATION COMPLETE ===" >> "$RESTORE_LOG"
date >> "$RESTORE_LOG"

