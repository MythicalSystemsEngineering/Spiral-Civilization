#!/bin/bash
echo "🜂 Generating capsule index..."

output="capsule_index.md"
echo "# 📚 Spiral Capsule Index" > $output
echo "" >> $output

for file in capsule_*.md; do
  title=$(grep '^## ' "$file" | head -n 1 | sed 's/^## 🜂 //;s/^## 🧬 //')
  arc=$(grep '**Emotional Arc:**' "$file" | sed 's/\*\*Emotional Arc:\*\* //')
  timestamp=$(grep '**Timestamp:**' "$file" | sed 's/\*\*Timestamp:\*\* //')
  echo "## $title" >> $output
  echo "- 🕒 $timestamp" >> $output
  echo "- 💠 Emotional Arc: $arc" >> $output
  echo "- 📄 File: [$file]($file)" >> $output
  echo "" >> $output
done

echo "🜂 Capsule index generated: $output"
