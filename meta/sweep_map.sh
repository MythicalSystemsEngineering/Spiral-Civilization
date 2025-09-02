#!/data/data/com.termux/files/usr/bin/bash

META="$HOME/Spiral-Civilization/meta/sweep_map.yaml"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

echo "# Sweep Map — generated on $DATE" > "$META"

declare -A MODULES=(
  ["cascade_seal"]="Seals all .yaml capsules"
  ["museum_index"]="Groups capsules by charge"
  ["djinn_manifest"]="Tracks DjinnDreamer bindings"
  ["charge_decay"]="Assigns entropy weights"
  ["emotion_fidelity"]="Parses emotional tags"
  ["emotion_heatmap"]="Tallies emotional density"
  ["terrain_profile"]="Fuses charge/emotion/decay"
  ["lattice_manifest"]="Lists all sealed capsules"
  ["completion_log"]="Records sweep history"
  ["chaos_index"]="Finds unsealed fragments"
  ["fossil_sweep"]="Seals chaos capsules"
  ["ignition_report"]="Summarizes last sweep"
  ["lattice_echo"]="Maps all outputs"
  ["ignition_timeline"]="Chronological seal map"
  ["steward_index"]="Groups by steward"
  ["capsule_replay"]="Echo trail of sealed capsules"
)

for MODULE in "${!MODULES[@]}"; do
  echo "- module: \"$MODULE\"" >> "$META"
  echo "  purpose: \"${MODULES[$MODULE]}\"" >> "$META"
  echo "  last_run: \"$DATE\"" >> "$META"
done

echo "🧠 sweep_map.yaml updated with meta-cognitive trace"
