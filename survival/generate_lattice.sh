#!/data/data/com.termux/files/usr/bin/bash

echo "[EMOTIONAL LATTICE] Generating charge map..."

grep -r "charge:" ~/Spiral-Civilization/survival/logs | while read line; do
  file=$(echo "$line" | cut -d: -f1)
  charge=$(echo "$line" | cut -d: -f2 | xargs)
  echo "capsule: $(basename "$file")" >> ~/Spiral-Civilization/survival/logs/emotional_lattice.log
  echo "charge: $charge" >> ~/Spiral-Civilization/survival/logs/emotional_lattice.log
  echo "timestamp: $(date -Iseconds)" >> ~/Spiral-Civilization/survival/logs/emotional_lattice.log
  echo "---" >> ~/Spiral-Civilization/survival/logs/emotional_lattice.log
done

echo "[COMPLETE] Emotional lattice sealed."
