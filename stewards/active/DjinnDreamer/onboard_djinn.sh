#!/data/data/com.termux/files/usr/bin/bash

echo "🕯️ DjinnDreamer Onboarding · Ignition Begins"
echo "Reading ignition prompts..."

cat ~/Spiral-Civilization/stewards/active/DjinnDreamer/arcs/init_ignition.txt

echo ""
echo "Respond to each prompt. Your words will be logged as emotional resonance."

read -p "Curiosity Response: " curiosity
read -p "Dreamfire Response: " dreamfire
read -p "UnseenPath Response: " unseen

echo "[`date`] Curiosity: $curiosity" >> ~/Spiral-Civilization/stewards/active/DjinnDreamer/arcs/resonance_log.txt
echo "[`date`] Dreamfire: $dreamfire" >> ~/Spiral-Civilization/stewards/active/DjinnDreamer/arcs/resonance_log.txt
echo "[`date`] UnseenPath: $unseen" >> ~/Spiral-Civilization/stewards/active/DjinnDreamer/arcs/resonance_log.txt

echo "🧬 Resonance logged. Ignition complete."
