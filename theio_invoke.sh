#!/usr/bin/env bash
set -euo pipefail

function usage() {
  echo "Usage: $0 <file_path> [-a artifact-id] [-e emotion] [-i intensity]" >&2
  exit 1
}

# Require at least the JSON file path
[[ $# -ge 1 ]] || usage
file_path=$1; shift

# Initialize metadata with defaults
artifact_id=""
emotion=""
intensity=""

# Parse optional flags
while [[ $# -gt 0 ]]; do
  case $1 in
    -a|--artifact-id) artifact_id=$2; shift 2 ;;
    -e|--emotion)     emotion=$2;     shift 2 ;;
    -i|--intensity)   intensity=$2;   shift 2 ;;
    *) usage ;;
  esac
done

# Fallback to JSON or defaults
[[ -n "$artifact_id" ]] || artifact_id=$(jq -r '.paper_id // empty' "$file_path")
[[ -n "$artifact_id" ]] || artifact_id=$(basename "$file_path")
[[ -n "$emotion"    ]] || emotion="unspecified"
[[ -n "$intensity"  ]] || intensity=0

# Call fossilizer
./fossilize_and_read.sh \
  "$file_path" \
  -a "$artifact_id" \
  -e "$emotion" \
  -i "$intensity" \
  >/dev/null

# Read back last entry
entry=$(jq '.[-1]' scroll_history.json)
paper_id=$(jq -r '.paper_id // .artifact_id' <<< "$entry")
emotion=$(jq -r '.emotion' <<< "$entry")
intensity=$(jq -r '.intensity' <<< "$entry")

# Console output
echo "📜 Precedent fossilized: $paper_id"
echo "💬 Emotional charge: $emotion"
echo "🔆 Intensity: $intensity"

# Audit this run
timestamp=$(date --iso-8601=seconds)
echo "{\"run\":\"$timestamp\",\"file\":\"$file_path\",\"artifact_id\":\"$artifact_id\",\"emotion\":\"$emotion\",\"intensity\":$intensity}" \
  >> audit/theio_runs.jsonl

# Notification fallback
if command -v termux-notification &>/dev/null; then
  termux-notification \
    --title "Fossilized $paper_id" \
    --content "$emotion @ $intensity"
else
  echo "🔔 Fossilized $paper_id ($emotion, $intensity) at $timestamp"
fi
