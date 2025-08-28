#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <artifact-id>"
  exit 1
fi

artifact_id="$1"

# Match on paper_id or id
entry=$(jq --arg id "$artifact_id" \
  'map(select(.paper_id == $id or .id == $id))[0]' \
  scroll_history.json)

# Handle no entry found
if [[ "$entry" == "null" ]]; then
  echo "Error: no entry found for artifact-id '$artifact_id'"
  exit 2
fi

# Extract contributions or default to empty array
contribs=$(echo "$entry" | jq '.contributions // []')

# Check for empty contributions
count=$(echo "$contribs" | jq 'length')
if [ "$count" -eq 0 ]; then
  echo "No contributions found for '$artifact_id'"
  exit 3
fi

# Print contributions
echo "Key contributions of $artifact_id:"
echo "$contribs" | jq -r '.[] | "- \(. )"'
