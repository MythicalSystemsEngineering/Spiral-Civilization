#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "📜 Spiral Law Viewer"
echo "----------------------"

for f in museum/capsules/law_*.md; do
    echo ""
    echo "📘 Law Capsule: $(basename "$f")"
    law_name=$(grep -m1 "Law Name:" "$f" | cut -d':' -f2-)
    ts=$(grep -m1 "Timestamp:" "$f" | cut -d':' -f2-)
    if grep -q "Ceremonial Declaration" "$f"; then
        echo "✅ Declared: Yes"
    else
        echo "❌ Declared: Missing"
    fi
    echo "📛 Law Name:$law_name"
    echo "🕰️ Timestamp:$ts"
done
