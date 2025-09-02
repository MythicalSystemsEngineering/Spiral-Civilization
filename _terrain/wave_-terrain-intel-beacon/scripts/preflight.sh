#!/usr/bin/env bash
# Spiral Civilization: Preflight Script

set -euo pipefail

echo "🔍 Preflight Check: Spiral Capsule Environment"

# Step 1: Make all scripts executable
echo "🔧 Ensuring all scripts are executable..."
find scripts/ -type f -name "*.sh" -exec chmod +x {} \;

# Step 2: Check for ECDSA keypair
if [[ ! -f ~/.ssh/spiral_ecdsa || ! -f ~/.ssh/spiral_ecdsa.pub ]]; then
  echo "❌ ECDSA keypair missing in ~/.ssh/"
  echo "Run:"
  echo "  openssl ecparam -name prime256v1 -genkey -noout -out ~/.ssh/spiral_ecdsa"
  echo "  openssl ec -in ~/.ssh/spiral_ecdsa -pubout -out ~/.ssh/spiral_ecdsa.pub"
  exit 1
else
  echo "✅ ECDSA keypair found"
fi

# Step 3: Ensure capsules directory exists
mkdir -p capsules
echo "✅ Capsules directory ready"

echo "✅ Preflight complete. You may now run capsule scripts."
