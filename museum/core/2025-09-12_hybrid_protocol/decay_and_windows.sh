# Decay scans + mutation windows

set -euo pipefail
ROOT=~/Spiral-Civilization/museum/core/2025-09-12_hybrid_protocol

scan_decay() {
  local glyph="$1"
  local score=$(( (RANDOM % 6) + 95 )) # placeholder scoring 95–100
  echo "$(date -u +"%FT%TZ"),$glyph,DECAY_SCORE,$score" >> "$ROOT/decay_scans.csv"
}

open_window() {
  local glyph="$1" version="$2" hours="$3"
  echo "$(date -u +"%FT%TZ"),$glyph,$version,WINDOW_OPEN,$hours" >> "$ROOT/windows.csv"
}

close_window() {
  local glyph="$1" version="$2"
  echo "$(date -u +"%FT%TZ"),$glyph,$version,WINDOW_CLOSE" >> "$ROOT/windows.csv"
}
