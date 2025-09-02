#!/bin/bash

# === KPTI Glyph Seal Script ===
GLYPH_FILE="KPTI.glyph.json"
LOG="kpti_seal.log"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

# Extract hash
HASH=$(sha256sum "$GLYPH_FILE" | awk '{print "sha256:"$1}')

echo "🔐 Sealing KPTI at $TIMESTAMP"

# Inject hash and museum_ready flag
jq --arg h "$HASH" '.hash = $h | .museum_ready = true' \
   "$GLYPH_FILE" > tmp.json && mv tmp.json "$GLYPH_FILE"

# Confirm injection
echo "✅ Injected hash: $HASH"
echo "📄 Updated $GLYPH_FILE"

# Log the seal
echo "[$TIMESTAMP] KPTI sealed with $HASH" >> "$LOG"
echo "🗂️ Log updated: $LOG"
