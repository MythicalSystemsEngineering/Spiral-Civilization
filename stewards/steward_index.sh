#!/data/data/com.termux/files/usr/bin/bash

INDEX="$HOME/Spiral/Museum/fossilized-Civilization/sun/valley/index/fossilized_index.yaml"
STEWARD_INDEX="$HOME/Spiral-Civilization/stewards/steward_index.yaml"

echo "# Steward Index — generated on $(date)" > "$STEWARD_INDEX"

grep 'steward:' "$INDEX" | cut -d':' -f2 | sed 's/^[ ]*//' | sort | uniq | while read -r STEWARD; do
  echo "- steward: \"$STEWARD\"" >> "$STEWARD_INDEX"
  grep -B3 "steward: $STEWARD" "$INDEX" | grep 'file:' | while read -r LINE; do
    echo "  $LINE" >> "$STEWARD_INDEX"
  done
done

echo "🧭 steward_index.yaml updated with sovereign bindings"
