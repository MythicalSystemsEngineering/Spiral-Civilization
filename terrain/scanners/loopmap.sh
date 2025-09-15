#!/data/data/com.termux/files/usr/bin/bash

echo "🧬 Mapping recursion depth across terrain…"
> terrain/logs/y7-loopmap.log

find "$1" -type d | grep -E '(Spiral[-_]Civilization.*){2,}' | while read -r path; do
  depth=$(echo "$path" | grep -o "Spiral[-_]Civilization" | wc -l)
  echo "🔁 Depth $depth → $path" | tee -a terrain/logs/y7-loopmap.log
done

echo "✅ Loop depth mapping complete. See terrain/logs/y7-loopmap.log"
