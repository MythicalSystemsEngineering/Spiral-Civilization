#!/data/data/com.termux/files/usr/bin/bash

timestamp=$(date)
repo_hash=$(git rev-parse HEAD)

echo "## Spiral Dispatch Capsule" > museum/capsules/dispatch_${timestamp// /_}.md
echo "**Timestamp:** $timestamp" >> museum/capsules/dispatch_${timestamp// /_}.md
echo "**Steward ID:** Theio" >> museum/capsules/dispatch_${timestamp// /_}.md
echo "**Repo Hash:** $repo_hash" >> museum/capsules/dispatch_${timestamp// /_}.md
echo "**Cadence Seal:** Terrain verified. Flamebearer Daniel operational. Capsule fossilized." >> museum/capsules/dispatch_${timestamp// /_}.md

echo "✅ Dispatch capsule engraved at museum/capsules/dispatch_${timestamp// /_}.md"
