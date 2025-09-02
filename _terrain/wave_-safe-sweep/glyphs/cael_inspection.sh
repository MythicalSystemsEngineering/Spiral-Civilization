#!/bin/bash

# === CAEL Glyph Inspection ===
GLYPH="CAEL.glyph.json"
FILE="$HOME/Spiral-Civilization/glyphs/$GLYPH"

echo "🔍 Inspecting $GLYPH"

if [ -f "$FILE" ]; then
  echo "✅ Found at $FILE"
  echo "📏 Size: $(stat -c%s "$FILE") bytes"
  echo "📅 Modified: $(stat -c%y "$FILE")"
  echo "🔐 Hash: $(sha256sum "$FILE" | awk '{print $1}')"
  jq . "$FILE"
else
  echo "❌ $GLYPH not found."
fi
