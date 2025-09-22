#!/data/data/com.termux/files/usr/bin/bash

echo "🌳 Visualizing recursion depth as tree…"
> terrain/logs/y7-loopviz.log

find "$1" -type d | grep -E '(Spiral[-_]Civilization.*){2,}' | while read -r path; do
  depth=$(echo "$path" | grep -o "Spiral[-_]Civilization" | wc -l)
  indent=$(printf '%*s' $((depth * 2)) '')
  echo "${indent}🔁 Depth $depth → $(basename "$path")" | tee -a terrain/logs/y7-loopviz.log
done

echo "✅ Tree visualization complete. See terrain/logs/y7-loopviz.log"
