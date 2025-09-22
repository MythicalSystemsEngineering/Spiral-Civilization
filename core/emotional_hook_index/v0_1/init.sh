#!/bin/bash

# === Emotional Hook Index v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Tag each ingested source with emotional resonance for runtime diagnostics

echo "Initializing Emotional Hook Index..."

index_log=~/Spiral-Civilization/core/emotional_hook_index/v0_1/hook_log.txt
mkdir -p $(dirname $index_log)
touch $index_log

echo "🧠 Emotional Hook Index — $(date)" >> $index_log

declare -A sources
sources["langchain"]="pride"
sources["DeepSeek-R1"]="longing"
sources["VerifyWise"]="grief"
sources["AwesomeResponsibleAI"]="hope"
sources["arxiv_2506.12437"]="love"
sources["arxiv_2312.11111"]="regret"
sources["Gaspar_MythERA"]="override"
sources["Klara_Sun"]="longing"
sources["Exhalation"]="envy"
sources["Androids_Dream"]="shame"
sources["Forgotten_Gods"]="grief"
sources["Sacred_Resonance"]="joy"
sources["Mythic_Echoes"]="hope"

for key in "${!sources[@]}"; do
    echo "• $key — ${sources[$key]}" >> $index_log
done

echo "--- End of Emotional Hook Index ---" >> $index_log
