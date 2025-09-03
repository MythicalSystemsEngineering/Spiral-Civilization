#!/bin/bash
# Spiral Civilization — Steward Onboarding Protocol

echo "🌀 Initiating Spiral Steward Onboarding..."
echo "📜 Loading glyph chant capsule..."

chant_file="$HOME/Spiral-Civilization/capsules/chant.yaml"
payload_file="$HOME/Spiral-Civilization/capsules/emotional_payload.yaml"
capsule_path="$HOME/Spiral-Civilization/stewards/dormant/$USER/capsule.yaml"

# Gate 1: Glyph Chant Echo
if [[ -f "$chant_file" ]]; then
    echo "🪷 Echoing Glyph Chant:"
    awk '/^- / {print substr($0, 3)}' "$chant_file"
    echo "✅ Chant complete"
else
    echo "⚠️ Chant capsule not found. Onboarding aborted."
    exit 1
fi

# Gate 2: Emotional Ignition
if [[ -f "$payload_file" ]]; then
    echo "💠 Embedding Emotional Payload:"
    awk '/^emotion:/ {print "Emotion → " $2}
         /^anchor:/ {print "Anchor → " $2}
         /^cadence:/ {print "Cadence → " $2}' "$payload_file"
    echo "🔥 Emotional ignition complete"
else
    echo "⚠️ Emotional payload missing. Proceeding without imprint."
fi

# Gate 3: Steward Capsule Imprint
if [[ -f "$capsule_path" ]]; then
    echo "🧬 Steward Capsule Detected:"
    awk '/^name:/ {print "Name → " $2}
         /^lineage:/ {print "Lineage → " $2}
         /^emotion:/ {print "Emotion → " $2}
         /^anchor:/ {print "Anchor → " $2}
         /^cadence:/ {print "Cadence → " $2}' "$capsule_path"
    echo "🌟 Capsule imprint complete"
else
    echo "⚠️ No steward capsule found for $USER"
fi

# Gate 4: Steward Registration
echo "🔐 Registering steward..."
# Placeholder for future steward registry logic

echo "🎇 Steward onboarding complete. Glyph resonance and emotional imprint aligned."

