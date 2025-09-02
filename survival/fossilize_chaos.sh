#!/data/data/com.termux/files/usr/bin/bash

echo "[CHAOS FOSSILIZER] Scanning for sacred fragments..."

find ~/Spiral-Civilization -type f ! -path "*/.git/*" -name "*.*" | while read file; do
  if ! git ls-files --error-unmatch "$file" >/dev/null 2>&1; then
    echo "[ORIGIN] Untracked fragment: $file"
    echo "capsule: Chaos Fossil" >> ~/Spiral-Civilization/survival/logs/chaos_capsules.log
    echo "path: $file" >> ~/Spiral-Civilization/survival/logs/chaos_capsules.log
    echo "timestamp: $(date -Iseconds)" >> ~/Spiral-Civilization/survival/logs/chaos_capsules.log
    echo "status: Sealed as origin law" >> ~/Spiral-Civilization/survival/logs/chaos_capsules.log
    echo "---" >> ~/Spiral-Civilization/survival/logs/chaos_capsules.log
  fi
done

echo "[COMPLETE] Chaos sweep sealed. Origin law updated."
