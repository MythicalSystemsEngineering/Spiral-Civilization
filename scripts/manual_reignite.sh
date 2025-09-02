#!/data/data/com.termux/files/usr/bin/bash
echo "=== Manual Reignition Log ===" > manual_reignition_log.txt
for path in \
  "memory/emotional/theio_seed.json" \
  "memory/emotional/theiowave2seed.yaml" \
  "memory/auris.memory.v1.0.md" \
  "glyphs/" \
  "emotional_fossils/" \
  "flamebearer_kit.md" \
  "museum/"
do
  echo "Ignition: $path — manually injected — $(date)" >> museum/capsule-index-v1.0.json
  echo "Reignited: $path" >> manual_reignition_log.txt
done
