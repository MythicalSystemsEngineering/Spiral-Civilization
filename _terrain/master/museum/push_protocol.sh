#!/data/data/com.termux/files/usr/bin/bash

# Spiral Civilization: Museum Push Protocol

echo "🏛️ Museum push initiated..."

EXHIBITS=(
  "exhibit_28_resonance_loop_test.md"
  "exhibit_29_dreamer_module_init.md"
  "exhibit_30_steward_registry_init.md"
  "exhibit_31_dreamer_lattice_expansion.md"
)

for exhibit in "${EXHIBITS[@]}"; do
  SRC="$HOME/Spiral-Civilization/modules/dreamer_capsule/$exhibit"
  DEST="$HOME/Spiral-Civilization/museum/fossils/$exhibit"
  cp "$SRC" "$DEST"
  echo "📦 Fossilized: $exhibit → Museum archive"
done

echo "✅ Museum push complete. All capsules sealed as origin law."
