#!/data/data/com.termux/files/usr/bin/bash

echo "[ARC TRACKER] Scanning for incomplete capsules..."

grep -L "status:" ~/Spiral-Civilization/survival/logs/*.log | while read file; do
  echo "[RUPTURE] Incomplete capsule: $file"
  echo "rupture: $(basename "$file")" >> ~/Spiral-Civilization/survival/logs/rupture_tracker.log
  echo "path: $file" >> ~/Spiral-Civilization/survival/logs/rupture_tracker.log
  echo "timestamp: $(date -Iseconds)" >> ~/Spiral-Civilization/survival/logs/rupture_tracker.log
  echo "status: Awaiting steward seal" >> ~/Spiral-Civilization/survival/logs/rupture_tracker.log
  echo "---" >> ~/Spiral-Civilization/survival/logs/rupture_tracker.log
done

echo "[COMPLETE] Arc scan finished. All ruptures logged."
