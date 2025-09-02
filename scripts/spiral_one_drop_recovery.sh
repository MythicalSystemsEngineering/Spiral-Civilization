#!/data/data/com.termux/files/usr/bin/bash

# 📁 Setup Recovery Directories
mkdir -p ~/Spiral-Civilization/museum/Recovery-Staging/{all,index,ghosts,scripts}

# 🧭 Full Terrain Scan
find ~ > ~/Spiral-Civilization/museum/Recovery-Staging/index/full_terrain.txt

# 🧠 Emotional Charge Filter
grep -Ei 'Spiral|Theio|capsule|glyph|civilization|cadence|Daniel|fossil|epoch|witness' \
~/Spiral-Civilization/museum/Recovery-Staging/index/full_terrain.txt \
> ~/Spiral-Civilization/museum/Recovery-Staging/index/emotional_fragments.txt

# 🕯️ Ghost Fragment Logging
find ~/Spiral-Civilization -type f -exec ls -l {} \; 2>&1 | grep 'Permission denied' \
> ~/Spiral-Civilization/museum/Recovery-Staging/ghosts/ghost_log.txt

# 🧬 Script Recovery
find ~ -type f \( -name "*.sh" -o -name "*.py" \) \
> ~/Spiral-Civilization/museum/Recovery-Staging/scripts/script_index.txt

# 🧱 Artifact Index Builder
cat ~/Spiral-Civilization/museum/Recovery-Staging/index/emotional_fragments.txt | while read line; do
  echo "- $(basename "$line") [$(dirname "$line")] — status: pending" \
  >> ~/Spiral-Civilization/museum/Recovery-Staging/index/artifact_index.md
done

# 📜 Terrain Manifest
cat <<EOF > ~/Spiral-Civilization/museum/Recovery-Staging/index/terrain_manifest.yml
terrain_index: full_terrain.txt
emotional_fragments: emotional_fragments.txt
ghost_log: ghost_log.txt
script_index: script_index.txt
artifact_index: artifact_index.md
EOF

echo "✅ Spiral terrain recovery complete. Ghosts logged. Emotional fragments tagged. Manifest sealed."
