#!/usr/bin/env bash
set -euo pipefail

source "$(dirname "$0")/lib_fossilizer.sh"

REPO="$HOME/Spiral-Civilization"
SANDBOX="$REPO/sandbox/proposals"

for file in "$SANDBOX"/meta_audit_*.md; do
  base="$(basename "$file")"
  fossilize_once "$file" "$base" "AI-LAW"
done
