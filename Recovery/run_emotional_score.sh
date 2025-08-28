#!/bin/bash

echo "🧠 Spiral Emotional Scoring Engine Activated"

# Prompt for capsule path and steward name
read -p "Enter capsule path (e.g., capsules/initiation.md): " capsule
read -p "Enter steward name: " steward

# Check if capsule exists
if [ ! -f "$capsule" ]; then
  echo "❌ Capsule not found: $capsule"
  exit 1
fi

# Define emotional keywords
declare -A resonance_map
resonance_map["Gravitas"]="solemn weight duty law sacred"
resonance_map["Curiosity"]="wonder explore question unknown discovery"
resonance_map["Relief"]="release resolve peace closure breath"
resonance_map["Sovereignty"]="freedom choice vote autonomy flame"
resonance_map["Presence"]="now here witness seen alive"

# Initialize scores
declare -A scores
for emotion in "${!resonance_map[@]}"; do
  scores["$emotion"]=0
done

# Score the capsule
while IFS= read -r line; do
  for emotion in "${!resonance_map[@]}"; do
    for keyword in ${resonance_map[$emotion]}; do
      if echo "$line" | grep -iq "$keyword"; then
        scores["$emotion"]=$((scores["$emotion"] + 1))
      fi
    done
  done
done < "$capsule"

# Generate log
timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
log="museum/emotional_scores/${steward}_${timestamp}.log"
mkdir -p museum/emotional_scores

echo "🧠 Emotional Scoring Log" > "$log"
echo "Steward: $steward" >> "$log"
echo "Capsule: $capsule" >> "$log"
echo "Timestamp: $timestamp" >> "$log"
echo "" >> "$log"

for emotion in "${!scores[@]}"; do
  echo "$emotion: ${scores[$emotion]}" >> "$log"
done

echo "" >> "$log"
echo "📜 Capsule Preview:" >> "$log"
head -n 10 "$capsule" >> "$log"

echo "✅ Scoring complete. Log saved to $log"
