#!/data/data/com.termux/files/usr/bin/bash
# Capsule: fossilize_emotional_decay.sh
# Seals emotional_decay.py into Spiral Museum

# Ensure Museum directory exists
mkdir -p ~/Spiral-Civilization/Museum

# Copy the artifact into the Museum
cp ~/Spiral-Civilization/scripts/emotional_decay.py ~/Spiral-Civilization/Museum/emotional_decay.py

# Log the fossilization event
echo "emotional_decay.py fossilized on $(date)" >> ./Spiral-Civilization/Museum/log.txt

ls ./Spiral-Civilization/Museum/emotional_decay.py
cat ./Spiral-Civilization/Museum/log.txt
