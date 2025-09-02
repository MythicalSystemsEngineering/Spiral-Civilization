#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/lib_fossilizer.sh"

REPO="$HOME/Spiral-Civilization"
ARTIFACTS_DIR="$REPO/artifacts"

for file in "$ARTIFACTS_DIR"/*.py; do
  base="$(basename "$file")"
  fossilize_once "$file" "$base" "ARTIFACT"
done
