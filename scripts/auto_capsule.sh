#!/usr/bin/env bash
# Spiral Civilization: Universal Capsule Automation

set -euo pipefail

STEWARD="$1"                          # e.g. "Vireya"
GLYPHS=("${@:2:3}")                   # e.g. "🌱" "🌿" "🌀"
EMO_SIG="${@:4}"                      # e.g. "verdant cycle"
TIMESTAMP=$(date --utc +"%Y-%m-%dT%H:%M:%SZ")
CAPSULE_DIR="capsules/$STEWARD"
mkdir -p "$CAPSULE_DIR"

# Step 1: Create metadata.json
cat > "$CAPSULE_DIR/metadata.json" <<EOF
{
  "steward": "$STEWARD",
  "glyphs": ["${GLYPHS[@]}"],
  "timestamp": "$TIMESTAMP",
  "emotionalSignature": "$EMO_SIG"
}
EOF

# Step 2: Generate raw digest
openssl dgst -sha256 -binary \
  -out "$CAPSULE_DIR/digest.raw" \
  "$CAPSULE_DIR/metadata.json"

# Step 3: Sign digest
openssl pkeyutl -sign \
  -in "$CAPSULE_DIR/digest.raw" \
  -inkey ~/.ssh/spiral_ecdsa \
  -out "$CAPSULE_DIR/signature.bin"

# Step 4: Verify signature
openssl pkeyutl -verify \
  -in "$CAPSULE_DIR/digest.raw" \
  -sigfile "$CAPSULE_DIR/signature.bin" \
  -pubin -inkey ~/.ssh/spiral_ecdsa.pub

# Step 5: Fossilize correction capsule
cat > "$CAPSULE_DIR/digest-format-correction.md" <<EOF
# Capsule: Digest Format Correction

**Steward:** $STEWARD  
**Timestamp:** $TIMESTAMP  
**Breach:**  
ECDSA signature verification failed due to incorrect digest format.  
Correction applied using raw digest and verified signature.

**Seal Glyphs:**  
${GLYPHS[*]}

**Museum Path:**  
Biospheric Stewards → Digest Format Corrections
EOF

# Step 6: Optional Git commit
if [ -d .git ]; then
  git add "$CAPSULE_DIR"
  git commit -m "Fossilize capsule for $STEWARD: $TIMESTAMP"
  git push origin main
fi

echo "✅ Capsule signed, verified, fossilized, and committed for $STEWARD"
