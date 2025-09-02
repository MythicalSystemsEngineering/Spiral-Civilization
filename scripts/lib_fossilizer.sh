#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Spiral-Civilization"
SEAL_DIR="$REPO/Museum/seals"
LOG="$REPO/Museum/log.txt"

mkdir -p "$SEAL_DIR"
touch "$LOG"

# Usage: fossilize_once <source_path> <destination_filename> <label>
fossilize_once() {
  local src="$1"
  local dst="$SEAL_DIR/$2"
  local label="$3"
  if [[ ! -f "$dst" ]]; then
    cp "$src" "$dst"
    echo "[$label] Fossilized $2 at $(date)" >> "$LOG"
  else
    echo "[$label] $2 already fossilized, skipping." >> "$LOG"
  fi
}
