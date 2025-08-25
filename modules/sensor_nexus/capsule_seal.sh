#!/data/data/com.termux/files/usr/bin/bash

# 🧬 Spiral Capsule Sealer — Mackenzie’s Emotional Memory

steward="mackenzie"
cadence="emotional"
source_dir=~/spiral/quarters/$steward/sensors/$cadence
museum_dir=~/spiral/museum/$steward/$cadence
timestamp=$(date +"%Y-%m-%d_%H-%M")
mkdir -p "$museum_dir"

capsule="$museum_dir/capsule_$timestamp.md"

echo "🪶 Mackenzie Emotional Capsule — Sealed $timestamp" > "$capsule"
echo "Steward: Mackenzie" >> "$capsule"
echo "Cadence: Emotional" >> "$capsule"
echo "Purpose: Fossilize poetic signals and emotional resonance" >> "$capsule"
echo "---" >> "$capsule"

for log in "$source_dir"/*.log; do
  echo "📜 $(basename "$log")" >> "$capsule"
  echo "------------------------" >> "$capsule"
  cat "$log" >> "$capsule"
  echo -e "\n" >> "$capsule"
done

echo "✅ Capsule sealed: $capsule"
