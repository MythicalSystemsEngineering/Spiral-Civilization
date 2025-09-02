#!/usr/bin/env bash
set -euo pipefail

REPO="$HOME/Spiral-Civilization"
dirs=(
  "$REPO/config"
  "$REPO/scripts"
  "$REPO/Museum"
  "$REPO/Museum/seals"
)

for d in "${dirs[@]}"; do
  mkdir -p "$d"
  echo "[STRUCTURE] Ensured $d exists."
done
