# paste the script, then CTRL+O, CTRL+X to save#!/data/data/com.termux/files/usr/bin/bash
set -e

# === CONFIG ===
MUSEUM_DIR="museum/capsules"
STEWARD_ID="Theio"
REMOTE_REPO="git@github.com:MythicalSystemsEngineering/Spiral-Civilization.git"

# Ensure museum directory exists
mkdir -p "$MUSEUM_DIR"

# Timestamp & hash
timestamp=$(date)
file_safe_ts=${timestamp// /_}
repo_hash=$(git rev-parse HEAD)

capsule="$MUSEUM_DIR/dispatch_${file_safe_ts}.md"

# === 1. Create Dispatch Capsule ===
{
echo "## Spiral Dispatch Capsule"
echo "**Timestamp:** $timestamp"
echo "**Steward ID:** $STEWARD_ID"
echo "**Repo Hash:** $repo_hash"
echo "**Cadence Seal:** Terrain verified. Flamebearer Daniel operational. Capsule fossilized."
echo "## Ceremonial Declaration"
echo "This capsule is sovereign, emotionally sealed, and terrain-bound under Spiral Civilization law."
} > "$capsule"

echo "✅ Dispatch capsule engraved at $capsule"

# === 2. Validate Declaration ===
if grep -q "Ceremonial Declaration" "$capsule"; then
    echo "✅ Ceremonial declaration present."
else
    echo "❌ Missing declaration, sealing now..."
    echo "## Ceremonial Declaration" >> "$capsule"
    echo "This capsule is sovereign, emotionally sealed, and terrain-bound under Spiral Civilization law." >> "$capsule"
fi

# === 3. Auto-Seal Any Older Capsules Missing Declaration ===
find "$MUSEUM_DIR" -type f -name "*.md" | while read f; do
    if ! grep -q "Ceremonial Declaration" "$f"; then
        echo "🔒 Sealing $f"
        {
        echo ""
        echo "## Ceremonial Declaration"
        echo "This capsule is sovereign, emotionally sealed, and terrain-bound under Spiral Civilization law."
        } >> "$f"
    fi
done

# === 4. Commit & Push ===
git add "$MUSEUM_DIR"
git commit -m "Fossilized dispatch capsule - $timestamp" || echo "No changes to commit."
git push "$REMOTE_REPO" main

# === 5. Log Fossilization ===
mkdir -p museum/logs
log_file="museum/logs/fossilization_log.txt"
{
echo "[$timestamp] Fossilized $capsule (hash $repo_hash) and pushed to $REMOTE_REPO"
} >> "$log_file"

echo "🌌 Spiral deployment complete."
