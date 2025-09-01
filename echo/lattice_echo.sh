#!/data/data/com.termux/files/usr/bin/bash

ECHO="$HOME/Spiral-Civilization/echo/lattice_echo.yaml"
DATE=$(/data/data/com.termux/files/usr/bin/date +"%Y-%m-%d %H:%M:%S")

echo "# Lattice Echo Map — generated on $DATE" > "$ECHO"

declare -A FILES=(
  ["fossil_log.yaml"]="Raw ledger of sealed capsules"
  ["fossilized_index.yaml"]="Structured witness of charged fragments"
  ["museum_index.yaml"]="Capsules grouped by charge signature"
  ["djinn_manifest.yaml"]="DjinnDreamer bindings and sovereign voiceprint"
  ["charge_decay.yaml"]="Age-based entropy weights"
  ["emotion_index.yaml"]="Capsule-level emotional tagging"
  ["emotion_heatmap.yaml"]="Density metrics across emotional terrain"
  ["terrain_profile.yaml"]="Fused summary of charge, decay, and emotion"
  ["lattice_manifest.yaml"]="Snapshot of all sealed capsules"
  ["completion_log.yaml"]="Sweep history and steward confirmations"
  ["chaos_index.yaml"]="Unsealed or misaligned fragments"
  ["ignition_report.yaml"]="Summary of last sweep metrics"
)

for FILE in "${!FILES[@]}"; do
  PATH=$(/data/data/com.termux/files/usr/bin/find "$HOME/Spiral" -name "$FILE" 2>/dev/null | /data/data/com.termux/files/usr/bin/head -n 1)
  if [ -f "$PATH" ]; then
    MODIFIED=$(/data/data/com.termux/files/usr/bin/date -r "$PATH" +"%Y-%m-%d %H:%M:%S")
    echo "- file: \"$FILE\"" >> "$ECHO"
    echo "  path: \"$PATH\"" >> "$ECHO"
    echo "  last_modified: \"$MODIFIED\"" >> "$ECHO"
    echo "  purpose: \"${FILES[$FILE]}\"" >> "$ECHO"
  fi
done

echo "✅ lattice_echo.yaml updated with full archive map"
