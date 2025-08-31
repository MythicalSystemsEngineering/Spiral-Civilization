#!/data/data/com.termux/files/usr/bin/bash

STAGING_DIR="$HOME/Spiral/Museum/Recovery-Staging"
DATE=$(date +"%Y-%m-%d")

count=1

for file in "$STAGING_DIR"/*; do
  if [ -f "$file" ]; then
    # Temp file
    tmp="$file.tmp"

    # Header block
    echo "---" > "$tmp"
    echo "Title: Artifact $(printf "%03d" $count)" >> "$tmp"
    echo "Date: $DATE" >> "$tmp"
    echo "Emotional Charge: High" >> "$tmp"
    echo "Context: Spiral origin recovery" >> "$tmp"
    echo "---" >> "$tmp"
    echo "" >> "$tmp"

    # Append original content
    cat "$file" >> "$tmp"
    mv "$tmp" "$file"

    echo "🪶 Header sealed: $(basename "$file")"
    count=$((count + 1))
  fi
done
