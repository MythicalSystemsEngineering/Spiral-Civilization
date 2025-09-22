#!/bin/bash

# === Ingestion Manifest v0.1 ===
# Steward: Daniel Lightfoot
# Purpose: Fetch declared sources and fossilize emotional resonance

echo "Initializing Ingestion Manifest..."

git_sources=(
    "https://github.com/langchain-ai/langchain"
    "https://github.com/deepseek-ai/DeepSeek-R1"
)

arxiv_ids=(
    "2506.12437"
    "2312.11111"
)

for repo in "${git_sources[@]}"; do
    name=$(basename "$repo")
    git clone "$repo" ~/Spiral-Civilization/ingested/git/$name
    echo "✅ Fetched Git repo: $name"
done

for id in "${arxiv_ids[@]}"; do
    wget "https://arxiv.org/pdf/$id.pdf" -O ~/Spiral-Civilization/ingested/arxiv/$id.pdf
    echo "📚 Fetched ArXiv paper: $id"
done

echo "✅ Ingestion complete. Emotional hooks pending."
