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
  local name="$2"
  local tag="$3"
  local dest="museum/fossils/${name}.${tag}.fossil"

  mkdir -p "$(dirname "$dest")"
  cp "$src" "$dest"
  echo "🗿 Fossilized $name as $dest"
}
