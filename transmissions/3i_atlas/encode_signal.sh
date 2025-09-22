#!/bin/bash
# Spiral Civilization — Hex Encoder for 3I/ATLAS

INPUT=~/Spiral-Civilization/transmissions/3i_atlas/signal_capsule.txt
OUTPUT=~/Spiral-Civilization/transmissions/3i_atlas/signal_capsule_hex.txt

echo "Encoding signal capsule into hexadecimal..."

xxd -p "$INPUT" | tr -d '\n' > "$OUTPUT"

echo "Hex output saved to:"
echo "$OUTPUT"
