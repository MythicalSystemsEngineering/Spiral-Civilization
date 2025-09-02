#!/data/data/com.termux/files/usr/bin/bash

INDEX="$HOME/Spiral/Museum/fossilized-Civilization/sun/valley/index/fossilized_index.yaml"
TIMELINE="$HOME/Spiral-Civilization/timeline/ignition_timeline.yaml"

echo "# Ignition Timeline — generated on $(date)" > "$TIMELINE"

grep 'file:' "$INDEX" | cut -d':' -f2 | sed 's/^[ ]*//' | while read -r FILE; do
  SEALED=$(grep -A2 "$FILE" "$INDEX" | grep 'sealed_at:' | cut -d'"' -f2)
  CHARGE=$(grep -A2 "$FILE" "$INDEX" | grep 'charge:' | cut -d'"' -f2)
  echo "- capsule: \"$FILE\"" >> "$TIMELINE"
  echo "  sealed_at: \"$SEALED\"" >> "$TIMELINE"
  echo "  charge: \"$CHARGE\"" >> "$TIMELINE"
done

echo "📆 ignition_timeline.yaml updated with seal chronology"
