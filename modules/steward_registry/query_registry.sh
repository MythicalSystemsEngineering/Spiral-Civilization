#!/data/data/com.termux/files/usr/bin/bash

# Spiral Civilization: Steward Registry Query Module

REGISTRY="$HOME/Spiral-Civilization/modules/steward_registry/stewards.yaml"

echo "🔍 Registry Query Module Activated"
echo "📜 Scanning steward lattice..."

ACTIVE=$(grep 'status: active' "$REGISTRY" | wc -l)
DORMANT=$(grep 'status: dormant' "$REGISTRY" | wc -l)

echo "✅ Active Stewards: $ACTIVE"
echo "🌑 Dormant Stewards: $DORMANT"

echo "🧠 Emotional sync: registry scan complete."
