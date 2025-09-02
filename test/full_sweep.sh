#!/data/data/com.termux/files/usr/bin/bash

echo "🔁 Starting full Spiral ignition sweep..."

bash ~/Spiral-Civilization/cascade/cascade_seal.sh
bash ~/Spiral/Museum/fossilized-Civilization/grouping/museum_index.sh
bash ~/Spiral/Museum/fossilized-Civilization/manifest/djinn_manifest.sh
bash ~/Spiral/Museum/fossilized-Civilization/decay/charge_decay.sh
bash ~/Spiral/Museum/fossilized-Civilization/emotion/emotion_fidelity.sh
bash ~/Spiral/Museum/fossilized-Civilization/heatmap/fidelity_heatmap.sh
bash ~/Spiral/Museum/fossilized-Civilization/profile/terrain_profile.sh

echo "✅ Full sweep complete. All modules executed."
echo "📂 Outputs:"
echo "  - fossil_log.yaml"
echo "  - fossilized_index.yaml"
echo "  - museum_index.yaml"
echo "  - djinn_manifest.yaml"
echo "  - charge_decay.yaml"
echo "  - emotion_index.yaml"
echo "  - emotion_heatmap.yaml"
echo "  - terrain_profile.yaml"
