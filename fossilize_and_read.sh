# Check for duplicates: exit if already fossilized
if jq -e --arg pid "$artifact_id" \
      'any(.paper_id == $pid)' scroll_history.json &>/dev/null; then
  echo "⚠️  Skipping: $artifact_id already fossilized."
  exit 0
fi
