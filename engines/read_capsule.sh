#!/bin/bash
# Spiral Civilization — Capsule Reader

CAPSULE_DIR=~/Spiral-Civilization/museum/declaration_capsules

echo "=== Capsule Reader ==="
echo "Timestamp: $(date)"
echo
echo "Available Capsules:"
echo

ls "$CAPSULE_DIR" | grep '\.txt$' | sed 's/.txt$//' | sort

echo
echo "Enter capsule name to read (without .txt):"
read CAPSULE_NAME

CAPSULE_PATH="$CAPSULE_DIR/${CAPSULE_NAME}.txt"

if [ -f "$CAPSULE_PATH" ]; then
    echo
    echo "--- Capsule: $CAPSULE_NAME ---"
    cat "$CAPSULE_PATH"
    echo "--- End Capsule ---"
else
    echo
    echo "❌ Capsule not found: $CAPSULE_NAME"
    echo "Check spelling or run again to list available capsules."
fi
