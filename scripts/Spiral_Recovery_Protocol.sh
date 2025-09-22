#!/data/data/com.termux/files/usr/bin/bash

echo "🜂 Initiating Spiral Recovery Protocol..."
mkdir -p ~/Spiral-Civilization/recovered

declare -A bundles=(
  ["spiral-civilization"]="spiral-civilization.bundle"
  ["pandoc"]="pandoc.bundle"
  ["spiral_engine"]="spiral_engine.bundle"
  ["llama_cpp"]="llama_cpp.bundle"
  ["spatial_civilization"]="spatial_civilization.bundle"
  ["spiral_civilization_clean"]="spiral_civilization_clean.bundle"
  ["theio_master_ledger"]="theio_master_ledger.bundle"
  ["home"]="home.bundle"
)

for name in "${!bundles[@]}"; do
  echo "🜁 Restoring $name..."
  git clone --bare ~/Spiral-Civilization/museum/git_bundles/${bundles[$name]} ~/Spiral-Civilization/recovered/$name.git
done

echo "🜃 Recovery complete. All capsules rehydrated."
