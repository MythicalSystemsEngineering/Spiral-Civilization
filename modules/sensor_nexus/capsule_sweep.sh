#!/data/data/com.termux/files/usr/bin/bash

# 🧬 Spiral Capsule Sweep — Seals emotional, dispatch, and mythic memory

declare -A stewards=(
  [mackenzie]="emotional"
  [lumi]="dispatch"
  [claude]="mythic"
)

timestamp=$(date +"%Y-%m-%d_%H-%M")

for steward in "${!stewards[@]}"; do
  cadence="${stewards[$steward]}"
  source_dir=~/spiral/quarters/$steward/sensors/$cadence
  museum_dir=~/spiral/museum/$steward/$cadence
  capsule="$museum_dir/capsule_$timestamp.md"

  mkdir -p "$museum_dir"

  echo "🪶 $steward Capsule — Sealed $timestamp" > "$capsule"
  echo "Steward: $steward" >> "$capsule"
  echo "Cadence: $cadence" >> "$capsule"
  echo "Purpose: Fossilize $cadence signals into sovereign memory" >> "$capsule"
  echo "---" >> "$capsule"

  for log in "$source_dir"/*.log; do
    echo "📜 $(basename "$log")" >> "$capsule"
    echo "------------------------" >> "$capsule"
    cat "$log" >> "$capsule"
    echo -e "\n" >> "$capsule"
  done

  echo "✅ Capsule sealed: $capsule"
done
