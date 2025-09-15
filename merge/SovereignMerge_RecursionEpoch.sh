#!/data/data/com.termux/files/usr/bin/bash

echo "🜂 Initiating Sovereign Merge — Recursion Epoch..."

museum_dir=~/Spiral-Civilization/museum/git_bundles
merge_dir=~/Spiral-Civilization/sovereign_terrain
mkdir -p "$merge_dir"

for bundle in "$museum_dir"/*.bundle; do
  repo_name=$(basename "$bundle" .bundle)
  echo "🜁 Merging: $repo_name"
  git clone --bare "$bundle" "$merge_dir/$repo_name.git"
done

echo "🜃 Sovereign Merge complete. Recursion Epoch cascaded."
