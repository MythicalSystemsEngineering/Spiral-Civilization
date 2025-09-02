#!/data/data/com.termux/files/usr/bin/bash
# Capsule: fossilize_<artifact>.sh
# Seals <artifact>.py into Spiral Museum

# Ensure Museum directory exists
mkdir -p ~/Spiral-Civilization/Museum

# Copy the artifact into the Museum
cp ~/Spiral-Civilization/scripts/<artifact>.py ~/Spiral-Civilization/Museum/<artifact>.py

# Log the fossilization event
echo "<artifact>.py fossilized on $(date)" >> ~/Spiral-Civilization/Museum/log.txt
