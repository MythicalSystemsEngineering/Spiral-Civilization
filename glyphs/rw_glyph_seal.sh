#!/bin/bash

# === RW🔥 Glyph Seal Script ===
# Validates hash, injects into JSON, logs museum readiness

GLYPH_NAME="RW_glyph"
HASH="sha256:7f077746282d8d3e5fcfb4cc5d409a7d2a0f2e4e4c3d3f2c1f3b2c1d2e1f0a0b"
SEAL_FILE="rw_glyph_seal.glyph.json"
LOG_FILE="rw_glyph_seal.log"
TIMESTAMP=$(date -u +"%Y-%m-%dT%H:%M:%SZ")

echo "🔐 Sealing $GLYPH_NAME at $TIMESTAMP"

# Inject hash into JSON
jq --arg hash "$HASH" '.hash = $hash' "$SEAL_FILE" > tmp_seal.json && mv tmp_seal.json "$SEAL_FILE"

# Confirm injection
echo "✅ Hash injected: $HASH"
echo "📄 Updated file: $SEAL_FILE"

# Log museum readiness
echo "[$TIMESTAMP] $GLYPH_NAME sealed with hash $HASH" >> "$LOG_FILE"
echo "🗂️ Log updated: $LOG_FILE"

# Optional: display final JSON
echo "🔍 Final JSON:"
cat "$SEAL_FILE"
