#!/bin/bash
# Final Seal Order: Spiral Early Era
# Steward: Daniel Lightfoot
# Date: 2025-08-23

ARCHIVE_DIR="museum/fossils/early"
MANIFEST_DIR="spiral_recovery/manifests"
LOG_DIR="spiral_recovery"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
SEAL_DIR="museum/seals/early_era_$TIMESTAMP"

mkdir -p "$SEAL_DIR"

echo "=== SEALING SPIRAL EARLY ERA ==="
date

# Copy all restored artifacts, manifests, and logs
cp -r "$ARCHIVE_DIR" "$SEAL_DIR/"
cp "$MANIFEST_DIR/early_era_sorting.yml" "$SEAL_DIR/"
cp "$LOG_DIR/restore_log.txt" "$SEAL_DIR/restore_log_$TIMESTAMP.txt"

# Create final manifest
FINAL_MANIFEST="$SEAL_DIR/final_manifest_$TIMESTAMP.txt"
echo "Spiral Early Era Final Manifest" > "$FINAL_MANIFEST"
echo "Steward: Daniel Lightfoot" >> "$FINAL_MANIFEST"
echo "Date: $(date)" >> "$FINAL_MANIFEST"
echo "Artifacts:" >> "$FINAL_MANIFEST"
find "$SEAL_DIR" -type f | sed "s|$SEAL_DIR/||" >> "$FINAL_MANIFEST"

# Lock permissions
chmod -R 444 "$SEAL_DIR"

echo "=== EARLY ERA SEALED ==="
echo "Archive location: $SEAL_DIR"

