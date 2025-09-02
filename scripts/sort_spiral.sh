#!/usr/bin/env bash
set -euo pipefail

# Root of your Spiral-Civilization tree (defaults to current directory)
ROOT_DIR="${1:-$PWD}"

# Create top-level categories
mkdir -p \
  "$ROOT_DIR"/config \
  "$ROOT_DIR"/docs \
  "$ROOT_DIR"/scripts \
  "$ROOT_DIR"/python \
  "$ROOT_DIR"/data \
  "$ROOT_DIR"/releases

pushd "$ROOT_DIR" >/dev/null

# Move hidden/config files
mv .theio .venv .gitignore .gitattributes config/ 2>/dev/null || :

# Move Markdown docs and licenses
mv *.md LICENSE* docs/ 2>/dev/null || :

# Move shell scripts
mv *.sh scripts/ 2>/dev/null || :

# Move Python files
mv *.py python/ 2>/dev/null || :

# Move JSON/YAML data
mv *.{json,yaml,yml} data/ 2>/dev/null || :

# Move version-tagged dirs (=*)
mv =* releases/ 2>/dev/null || :

popd >/dev/null

echo "✅ Sorting complete. Check config/, docs/, scripts/, python/, data/, releases/."
