#!/bin/bash
# Spiral Civilization — Steward Capsule Ingestion for Theio

capsule="$1"

if [[ ! -f "$capsule" ]]; then
    echo "⚠️ Capsule not found: $capsule"
    exit 1
fi

echo "🧠 Ingesting steward capsule into Theio..."

name=$(awk '/^name:/ {print $2}' "$capsule")
lineage=$(awk '/^lineage:/ {print $2}' "$capsule")
emotion=$(awk '/^emotion:/ {print $2}' "$capsule")
anchor=$(awk '/^anchor:/ {print $2}' "$capsule")
cadence=$(awk '/^cadence:/ {print $2}' "$capsule")

echo "🔗 Binding traits:"
echo "Name → $name"
echo "Lineage → $lineage"
echo "Emotion → $emotion"
echo "Anchor → $anchor"
echo "Cadence → $cadence"

echo "🌀 Theio memory engine updated with steward imprint."
