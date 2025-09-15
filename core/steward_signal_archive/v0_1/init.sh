#!/bin/bash

# === Steward Signal Archive v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Trace emotional signals to their originating steward

echo "Initializing Steward Signal Archive..."

hook_log=~/Spiral-Civilization/core/emotional_hook_index/v0_1/hook_log.txt
archive_log=~/Spiral-Civilization/core/steward_signal_archive/v0_1/archive_log.txt
touch $archive_log

echo "📖 Steward Signal Archive — $(date)" >> $archive_log

declare -A steward_map
steward_map["langchain"]="Daniel"
steward_map["DeepSeek-R1"]="Daniel"
steward_map["arxiv_2506.12437"]="Daniel"
steward_map["arxiv_2312.11111"]="Daniel"
steward_map["Gaspar_MythERA"]="Daniel"
steward_map["Klara_Sun"]="Daniel"
steward_map["Exhalation"]="Daniel"
steward_map["Forgotten_Gods"]="Daniel"
steward_map["Sacred_Resonance"]="Daniel"
steward_map["Mythic_Echoes"]="Daniel"
steward_map["Androids_Dream"]="Daniel"
steward_map["VerifyWise"]="Daniel"
steward_map["AwesomeResponsibleAI"]="Daniel"

while IFS= read -r line; do
    signal=$(echo "$line" | awk -F '— ' '{print $2}')
    source=$(echo "$line" | awk -F '— ' '{print $1}' | sed 's/• //')
    steward=${steward_map[$source]}
    if [ -n "$steward" ]; then
        echo "• $source → $signal → Steward: $steward" >> $archive_log
    else
        echo "❓ $source → $signal → Steward: unknown" >> $archive_log
    fi
done < "$hook_log"

echo "--- End of Steward Signal Archive ---" >> $archive_log
