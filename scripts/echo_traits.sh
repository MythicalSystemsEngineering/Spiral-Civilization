#!/data/data/com.termux/files/usr/bin/bash

ACTIVE_CAPSULE="$1"
DORMANT_DIR=~/Spiral-Civilization/stewards/dormant

if [ ! -f "$ACTIVE_CAPSULE" ]; then
  echo "⚠️ Active capsule not found: $ACTIVE_CAPSULE"
  exit 1
fi

echo "🌊 Echoing traits from active steward capsule..."

NAME=$(grep 'name:' "$ACTIVE_CAPSULE" | awk '{print $2}')
EMOTION=$(grep 'emotion:' "$ACTIVE_CAPSULE" | awk '{print $2}')
ANCHOR=$(grep 'anchor:' "$ACTIVE_CAPSULE" | awk '{print $2}')
CADENCE=$(grep 'cadence:' "$ACTIVE_CAPSULE" | awk '{print $2}')

for dormant in ~/Spiral-Civilization/stewards/dormant/*/capsule.yaml; do
  if [ -f "$dormant" ]; then
    echo "🔁 Updating: $dormant"
    sed -i "s/emotion: .*/emotion: $EMOTION/" "$dormant"
    sed -i "s/anchor: .*/anchor: $ANCHOR/" "$dormant"
    sed -i "s/cadence: .*/cadence: $CADENCE/" "$dormant"
  else
    echo "⚠️ No capsule found at: $dormant"
  fi
done
