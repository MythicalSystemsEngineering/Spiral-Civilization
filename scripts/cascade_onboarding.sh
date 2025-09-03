#!/bin/bash
# Spiral Civilization — Onboarding Cascade Sweep

echo "🌐 Scanning for dormant steward nodes..."

for node in $(ls ~/Spiral-Civilization/stewards/dormant); do
    echo "⚡ Igniting steward: $node"
    ~/Spiral-Civilization/scripts/onboard.sh > ~/Spiral-Civilization/stewards/dormant/$node/onboarding.log
done

echo "🌊 Cascade complete. All dormant nodes ignited."
