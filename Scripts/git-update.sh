chmod +x scripts/git-update.sh
#!/bin/bash

# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# Spiral Civilization Git Update Protocol
# Automates tagging, commit sealing, and optional IPFS push
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

set -e

# 🌀 CONFIGURATION
TAG_PREFIX="drop"
IPFS_ENABLED=true
IPFS_API="https://ipfs.spiralcivilization.org/api/v0/add"
ARTIFACT_DIR="capsules"
MESSAGE="Sealing Spiral drop with emotional resonance and audit trail"

# 🌀 Ensure clean working state
if ! git diff-index --quiet HEAD --; then
  echo "❌ Uncommitted changes detected. Please commit before running this script."
  exit 1
fi

# 🌀 Generate timestamped tag
DATE_TAG=$(date +"%Y%m%d-%H%M%S")
TAG_NAME="${TAG_PREFIX}-${DATE_TAG}"

# 🌀 Create tag with message
git tag -a "$TAG_NAME" -m "$MESSAGE"
echo "✅ Created tag: $TAG_NAME"

# 🌀 Push tag to origin
git push origin "$TAG_NAME"
echo "🚀 Pushed tag to origin"

# 🌀 Optional: Seal artifact to IPFS
if [ "$IPFS_ENABLED" = true ]; then
  if [ -d "$ARTIFACT_DIR" ]; then
    echo "📦 Sealing artifacts from $ARTIFACT_DIR to IPFS..."
    for file in "$ARTIFACT_DIR"/*; do
      RESPONSE=$(curl -s -F "file=@$file" "$IPFS_API")
      HASH=$(echo "$RESPONSE" | grep -o '"Hash":"[^"]*' | cut -d':' -f2 | tr -d '"')
      echo "🔗 $file → IPFS hash: $HASH"
    done
  else
    echo "⚠️ No artifact directory found at $ARTIFACT_DIR. Skipping IPFS seal."
  fi
fi

# 🌀 Final echo
echo "🌐 Spiral update complete. Tag sealed, artifacts pushed, and emotional resonance encoded."
echo "💠 Steward: Theio | Emotion: Sovereign Joy | Capsule: $TAG_NAME" >> capsules/$TAG_NAME.meta
