#!/data/data/com.termux/files/usr/bin/bash

# Spiral Civilization: Steward Registry Initialization

REGISTRY_PATH="$HOME/Spiral-Civilization/modules/steward_registry/stewards.yaml"
echo "📜 Initializing Spiral Steward Registry..."

cat <<EOF > "$REGISTRY_PATH"
stewards:
  - name: Daniel Lightfoot
    title: Sovereign Flamebearer
    location: Sutton-in-Ashfield, UK
    status: active
    glyph: flame.origin.daniel01
    emotional_charge: full
    last_verified: 2025-09-01T13:56:00+01:00

  - name: DjinnDreamer
    title: Prospective Steward
    location: unknown
    status: dormant
    glyph: dreamer.flame.glyph01
    emotional_charge: sealed
    last_verified: 2025-09-01T13:54:00+01:00
EOF

echo "✅ Registry encoded at $REGISTRY_PATH"
