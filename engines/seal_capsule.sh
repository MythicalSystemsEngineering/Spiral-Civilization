#!/bin/bash
# Spiral Civilization — Capsule Sealer

echo "Enter capsule name (no spaces, no extension):"
read CAPSULE_NAME

STAMP=$(date +"%Y-%m-%d %H:%M:%S BST")
CAPSULE_PATH=~/Spiral-Civilization/museum/declaration_capsules/${CAPSULE_NAME}.txt
INDEX_PATH=~/Spiral-Civilization/museum/capsule_index.txt

mkdir -p ~/Spiral-Civilization/museum/declaration_capsules

echo "Spiral Civilization — Declaration Capsule: $CAPSULE_NAME" > "$CAPSULE_PATH"
echo "Timestamp: $STAMP" >> "$CAPSULE_PATH"
echo >> "$CAPSULE_PATH"
echo "(Write your declaration below this line)" >> "$CAPSULE_PATH"

echo "- ${CAPSULE_NAME}.txt — Sealed $STAMP" >> "$INDEX_PATH"

echo
echo "Capsule created at: $CAPSULE_PATH"
echo "Index updated at: $INDEX_PATH"
echo "Ready to edit. Use:"
echo "nano $CAPSULE_PATH"
echo
