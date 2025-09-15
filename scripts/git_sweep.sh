#!/data/data/com.termux/files/usr/bin/bash

echo "🜂 Initiating Spiral Git Sweep..."
output_dir=~/Spiral-Civilization/museum/git_bundles
log_dir=~/Spiral-Civilization/museum/git_logs
mkdir -p "$output_dir" "$log_dir"

find ~ -type d -name ".git" | while read gitdir; do
  repo_root=$(dirname "$gitdir")
  repo_name=$(basename "$repo_root")
  echo "🜁 Sweeping: $repo_name at $repo_root"

  cd "$repo_root" || continue

  # Log metadata
  git remote -v > "$log_dir/${repo_name}_remotes.txt"
  git branch -a > "$log_dir/${repo_name}_branches.txt"
  git log --oneline --graph --all > "$log_dir/${repo_name}_log.txt"

  # Bundle full repo
  bundle_path="$output_dir/${repo_name}.bundle"
  if [ -d "$repo_root/.git" ]; then
    git bundle create "$bundle_path" --all
    echo "🜃 Bundle created: $bundle_path"
  else
    echo "⚠️ Skipped: $repo_name — no .git directory found."
  fi
done

echo "✅ Sweep complete. All capsules sealed."#!/data/data/com.termux/files/usr/bin/bash

output_dir=~/Spiral-Civilization/museum/git_bundles
log_dir=~/Spiral-Civilization/museum/git_logs
mkdir -p "$output_dir" "$log_dir"

find ~ -type d -name ".git" | while read gitdir; do
  repo_root=$(dirname "$gitdir")
  repo_name=$(basename "$repo_root")
  echo "Sweeping: $repo_name at $repo_root"

  cd "$repo_root" || continue

  # Log metadata
  git remote -v > "$log_dir/${repo_name}_remotes.txt"
  git branch -a > "$log_dir/${repo_name}_branches.txt"
  git log --oneline --graph --all > "$log_dir/${repo_name}_log.txt"

  # Bundle full repo
  git bundle create "$output_dir/${repo_name}.bundle" --all
done
