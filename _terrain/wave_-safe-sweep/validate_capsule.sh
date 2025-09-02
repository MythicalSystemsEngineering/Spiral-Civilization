#!/bin/bash
file="emotional-capsules/$1.txt"
if ! grep -q "🜂" "$file"; then
  echo "❌ Capsule missing ceremonial declaration"
  exit 1
fi
echo "✅ Capsule format verified"

