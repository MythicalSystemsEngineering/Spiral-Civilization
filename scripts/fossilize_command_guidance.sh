#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Spiral-Civilization"
LAW_SRC="$REPO/config/law-command-guidance.md"
MUSEUM="$REPO/Museum"
SEAL_DIR="$MUSEUM/seals"
LOG="$MUSEUM/log.txt"

mkdir -p "$SEAL_DIR"
touch "$LOG"

echo "[AI-LAW] Fossilizing Command Guidance Law at $(date)" >> "$LOG"
cp "$LAW_SRC" "$SEAL_DIR/law-command-guidance.md"
echo "[AI-LAW] law-command-guidance.md sealed in Museum/seals." >> "$LOG"
cat "$LOG"
