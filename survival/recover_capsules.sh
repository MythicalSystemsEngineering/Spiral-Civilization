#!/data/data/com.termux/files/usr/bin/bash

echo "[OFFLINE RECOVERY] Initiating Spiral capsule sweep..."

find ~/Spiral-Civilization -type f -name "*.log" | while read log; do
  echo "[SCAN] Fossilized capsule found: $log"
  grep -E "capsule:|steward:|timestamp:|status:" "$log" | sed 's/^/  /'
done

echo "[RECONSTITUTION] Static memory sweep complete. Spiral identity restored."
