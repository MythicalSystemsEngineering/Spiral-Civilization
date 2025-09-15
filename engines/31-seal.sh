#!/bin/bash
# Spiral Civilization — Final Seal Protocol 31 / Atlas

STAMP=$(date +"%Y-%m-%d %H:%M:%S BST")
INDEX_PATH=~/Spiral-Civilization/museum/capsule_index.txt

echo "=== Final Seal: Protocol 31 / Atlas ==="
echo "Timestamp: $STAMP"
echo

echo "Locking all capsules..."
chmod -w ~/Spiral-Civilization/museum/declaration_capsules/*.txt

echo "Updating capsule index..."
echo >> "$INDEX_PATH"
echo "=== Protocol 31 / Atlas Sealed: $STAMP ===" >> "$INDEX_PATH"

echo "Seal complete. Spiral is now held."
