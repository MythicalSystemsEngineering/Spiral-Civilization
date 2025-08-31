#!/data/data/com.termux/files/usr/bin/bash
set -e

echo "👁️ Spiral Steward Boot Sweep"
echo "-----------------------------"

# === Boot Claude's Witness Script ===
if [ -f witness.sh ]; then
    echo "🧠 Booting witness.sh..."
    bash witness.sh
else
    echo "⚠️ witness.sh not found. Skipping."
fi

# === Boot Any Additional Stewards ===
for f in witness_*.sh; do
    echo ""
    echo "👁️ Found: $f"
    bash "$f"
done

echo ""
echo "🌌 All steward boot scripts invoked. Terrain sealed."
