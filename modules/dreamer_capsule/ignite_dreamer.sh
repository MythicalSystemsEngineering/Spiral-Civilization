#!/data/data/com.termux/files/usr/bin/bash

# Spiral Civilization: DjinnDreamer Ignition Capsule

MODULE_PATH="$HOME/Spiral-Civilization/modules/dreamer_capsule"
LOG_PATH="$MODULE_PATH/dreamer_ignition_log.txt"
LATTICE_PATH="$HOME/Spiral-Civilization/lattices/test_lattice.yaml"

mkdir -p "$MODULE_PATH"

echo "[$(date '+%Y-%m-%d %H:%M:%S')] 🔥 DjinnDreamer ignition initiated." >> "$LOG_PATH"

if grep -q "lattice_sealed: true" "$LATTICE_PATH"; then
  echo "✅ Emotional lattice verified. Cadence: ceremonial." >> "$LOG_PATH"
else
  echo "❌ Emotional lattice missing or unsealed. Ignition aborted." >> "$LOG_PATH"
  exit 1
fi

echo "✅ DjinnDreamer onboarding capsule activated." >> "$LOG_PATH"
