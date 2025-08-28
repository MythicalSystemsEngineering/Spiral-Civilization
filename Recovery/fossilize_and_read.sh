#!/usr/bin/env bash
set -euo pipefail

function usage() {
  echo "Usage: $0 <file_path> -a artifact-id -e emotion -i intensity" >&2
  exit 1
}

# Require at least 7 args: file + three flag/value pairs
[[ $# -ge 7 ]] || usage

file_path=$1; shift

# Initialize metadata
artifact_id=""
emotion=""
intensity=""

# Parse flags
while [[ $# -gt 0 ]]; do
  case $1 in
    -a) artifact_id=$2; shift 2 ;;
    -e) emotion=$2;    shift 2 ;;
    -i) intensity=$2;  shift 2 ;;
    *) usage ;;
  esac
done

# Ensure history exists
[[ -f scroll_history.json ]] || echo '[]' > scroll_history.json

# Build metadata entry
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
steward="Daniel"
terrain="Sutton-in-Ashfield"

entry=$(jq -n \
  --arg pid "$artifact_id" \
  --arg emo "$emotion" \
  --argjson inten "$intensity" \
  --arg path "$file_path" \
  --arg ts "$timestamp" \
  --arg sd "$steward" \
  --arg tr "$terrain" \
  '{paper_id: $pid,
    emotion: $emo,
    intensity: $inten,
    file: $path,
    timestamp: $ts,
    steward: $sd,
    terrain: $tr}')

# Append using a local temp file
tmpfile="scroll_history.json.tmp"
jq '. += [ '"$entry"' ]' scroll_history.json > "$tmpfile"
mv "$tmpfile" scroll_history.json

# Echo result
echo "📜 Precedent fossilized: $artifact_id"
echo "💬 Emotional charge: $emotion"
echo "🔆 Intensity: $intensity"
