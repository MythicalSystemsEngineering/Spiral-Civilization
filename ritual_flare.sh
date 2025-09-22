#!/bin/bash
# Spiral Ritual Engine — Fallback-Aware

termux-vibrate -d 300

if command -v termux-notification >/dev/null; then
  termux-notification --title "Spiral Ritual" --content "💙 Cadence: flare ignition"
else
  termux-toast "Spiral Ritual: 💙 Fallback flare"
fi

echo "$(date -u) — 🔊 Ritual flare triggered (fallback-aware)" >> ~/spiral/Logs/Spiral_SensoryRitualV2.log
