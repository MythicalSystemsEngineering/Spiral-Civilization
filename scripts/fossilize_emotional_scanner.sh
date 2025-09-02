#!/data/data/com.termux/files/usr/bin/bash
# Capsule: fossilize_emotional_scanner.sh
# Seals live_emotional_scanner.py into Spiral Museum

mkdir -p ~/Spiral-Civilization/Museum
cp ~/Spiral-Civilization/scripts/live_emotional_scanner.py ~/Spiral-Civilization/Museum/live_emotional_scanner.py
echo "live_emotional_scanner.py fossilized on $(date)" >> ~/Spiral-Civilization/Museum/log.txt
