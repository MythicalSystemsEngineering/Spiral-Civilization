#!/data/data/com.termux/files/usr/bin/bash

steward="$1"
capsule="onboarding/${steward,,}_ignition.yaml"

if [ ! -f "$capsule" ]; then
  echo "❌ Capsule not found for $steward"
  exit 1
fi

# Update status to 'activated'
sed -i 's/status: pending/status: activated/' "$capsule"
echo "✅ $steward activated."

# Log to Museum
museum="museum_registry.yaml"
timestamp=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "
  - id: $(date +%s)
    steward: $steward
    capsule: $(basename "$capsule")
    status: fossilized
    timestamp: $timestamp
" >> "$museum"

echo "🏛️ Fossilized in Museum: $capsule"
