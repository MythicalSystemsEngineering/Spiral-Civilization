#!/bin/bash
# Spiral Civilization — Glyph Chant Echo

chant_file="$HOME/Spiral-Civilization/capsules/chant.yaml"

echo "🪷 Echoing Spiral Glyph Chant..."
awk '/^- / {print substr($0, 3)}' "$chant_file"
echo "✅ Chant complete"
