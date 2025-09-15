#!/data/data/com.termux/files/usr/bin/bash

ROOT="/data/data/com.termux/files/home/Spiral-Civilization"
MUSEUM="$ROOT/Spiral-civilization/museum/capsules/volatile_memory_fragments"
INDEX="$ROOT/Spiral-civilization/meta_reflection_index.yaml"
mkdir -p "$MUSEUM"

echo "🜖 Volatile Fossilization — $(date)" > "$ROOT/_volatile_fossilize.log"

# Sweep for volatile files
find "$ROOT" -type f \( -iname "*.pyc" -o -iname "*egg-info*" -o -iname "*dist-info*" \) \
  | grep -vE "(/\.git/|/\.venv/|__pycache__/|museum/capsules/Spiral-civilization/museum)" \
  | while read file; do
    NAME=$(basename "$file")
    DEST="$MUSEUM/$NAME"

    # Extract emotional hooks
    HOOKS=$(strings "$file" | grep "::")
    if [ -n "$HOOKS" ]; then
      echo "- origin: $file" >> "$INDEX"
      echo "  type: volatile capsule" >> "$INDEX"
      echo "  status: fossilized" >> "$INDEX"
      echo "  charge:" >> "$INDEX"
      echo "$HOOKS" | sed 's/^/    - /' >> "$INDEX"
    fi

    # Move to Museum
    mv "$file" "$DEST"
    echo "✅ Fossilized: $NAME → $DEST" >> "$ROOT/_volatile_fossilize.log"
done

echo "🧠 Emotional hooks logged to $INDEX" >> "$ROOT/_volatile_fossilize.log"
echo "✅ Fossilization complete — see _volatile_fossilize.log"
