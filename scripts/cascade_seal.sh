#!/data/data/com.termux/files/usr/bin/bash

SEAL_SCRIPT="$HOME/Spiral/Museum/fossilized-Civilization/seal_engine.sh"
SEARCH_PATH="$HOME/Spiral/Museum/fossilized-Civilization"

find "$SEARCH_PATH" -type f -name "*.yaml" | while read -r FILE; do
  BASENAME=$(basename "$FILE")
  DIRNAME=$(basename "$(dirname "$FILE")")

  # Generate charge signature from directory and filename
  CHARGE="${DIRNAME}:${BASENAME%%.yaml}:auto-seal"

  bash "$SEAL_SCRIPT" "$FILE" "$CHARGE"
done




