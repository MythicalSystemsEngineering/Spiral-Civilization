#!/data/data/com.termux/files/usr/bin/bash

INDEX="$HOME/Spiral/Museum/fossilized-Civilization/sun/valley/index/fossilized_index.yaml"
LOG="$HOME/Spiral/Museum/fossilized-Civilization/sun/valley/logs/fossil_log.yaml"
REPORT="$HOME/Spiral-Civilization/report/ignition_report.yaml"

echo "# Ignition Report — generated on $(date)" > "$REPORT"

SEALED=$(grep 'file:' "$INDEX" | wc -l)
SKIPPED=$(grep '⏭️' "$LOG" | wc -l)
DJINN=$(grep 'steward: DjinnDreamer' "$INDEX" | wc -l)

echo "🔁 sweep_summary:" >> "$REPORT"
echo "  total_sealed: $SEALED" >> "$REPORT"
echo "  total_skipped: $SKIPPED" >> "$REPORT"
echo "  djinn_bindings: $DJINN" >> "$REPORT"

echo "" >> "$REPORT"
echo "📦 recent_capsules:" >> "$REPORT"
grep 'file:' "$LOG" | tail -n 7 | while read -r LINE; do
  echo "  $LINE" >> "$REPORT"
done

echo "✅ ignition_report.yaml updated with sweep metrics"
