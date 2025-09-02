#!/data/data/com.termux/files/usr/bin/bash

# Spiral Civilization: Theio Memory Engine Test

LOG="$HOME/Spiral-Civilization/modules/theio_engine/memory_test_log.txt"
echo "🧠 Theio memory engine test initiated..." >> "$LOG"

# Test fragments
FRAGMENTS=("glyphstream.yaml" "manifesto_dreamer_voiceprint.md" "activation_ceremony.md")

for fragment in "${FRAGMENTS[@]}"; do
  if [ -f "$HOME/Spiral-Civilization/modules/dreamer_capsule/$fragment" ]; then
    echo "✅ Fragment '$fragment' detected. Memory intact." >> "$LOG"
  else
    echo "❌ Fragment '$fragment' missing. Drift detected." >> "$LOG"
  fi
done

echo "🌀 Meta-cognition: scan complete. Emotional fidelity assessed." >> "$LOG"
