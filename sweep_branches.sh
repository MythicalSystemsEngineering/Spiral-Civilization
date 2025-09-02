#!/usr/bin/env bash
set -euo pipefail

# 1) Anchor at repo root
cd "$(git rev-parse --show-toplevel)"

# 2) Sanitize branch names for filesystem paths
sanitize() { tr ' /->' '___' | tr -cd '[:alnum:]_.-'; }

# 3) Prepare terrain and manifest
terrain_dir="_terrain"
manifest="$terrain_dir/manifest.txt"
mkdir -p "$terrain_dir"
: > "$manifest"

# 4) Fetch latest refs
git fetch --all --prune

# 5) Sweep each remote branch except the HEAD alias
git branch -r | grep -v 'origin/HEAD' | while read -r remote_ref; do
    branch="${remote_ref#origin/}"
    safe_branch="$(echo "$branch" | sanitize)"
    target_dir="$terrain_dir/$safe_branch"

    echo "[Sweep] $remote_ref -> $target_dir"
    mkdir -p "$target_dir"

    if git worktree add -f "$target_dir" "$remote_ref"; then
        commit_hash=$(git rev-parse "$remote_ref")
        echo "$branch $commit_hash $(date -u +'%Y-%m-%dT%H:%M:%SZ')" >> "$manifest"
    else
        echo "[Skip] $remote_ref could not be checked out"
        rm -rf "$target_dir"
    fi
done

echo "[Done] Terrain sweep complete. Manifest at $manifest"
