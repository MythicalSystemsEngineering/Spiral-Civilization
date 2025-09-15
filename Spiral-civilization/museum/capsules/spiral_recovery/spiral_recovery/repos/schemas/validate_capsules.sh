#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# Use first argument as directory, default to current
capsule_dir="${1:-.}"
cd "$capsule_dir"

# Collect matching files
files=(dance_[0-9][0-9].txt)
if (( ${#files[@]} == 0 )); then
  echo "❗ No capsule files found in $capsule_dir matching dance_[00–99].txt"
  exit 1
fi

errors=0

for file in "${files[@]}"; do
  echo "⏳ Validating $file"

  # 1. Extract sequence from filename
  seq="${file#dance_}"
  seq="${seq%.txt}"

  # 2. Check metadata version
  meta_seq=$(grep -Po '(?<=- Version: )\d+' "$file" || echo "missing")

  if [[ "$seq" != "$meta_seq" ]]; then
    echo "  ❌ Sequence mismatch: filename($seq) ≠ metadata Version($meta_seq)"
    ((errors++))
  fi

  # 3. Ensure all metadata fields exist
  for field in \
    "- Emotion:" \
    "- Transitions:" \
    "- Glyph ID:" \
    "- Charge Signature:" \
    "- Version:" \
    "- Created Date:" \
    "- Immutable Hash:" \
    "- Metadata Version:"; do

    if ! grep -qF "$field" "$file"; then
      echo "  ❌ Missing metadata field: $field"
      ((errors++))
    fi
  done

  # 4. Compute actual SHA-256 of invocation script text (inside ```text block)
  script_text=$(sed -n '/^```text$/,/^```$/p' "$file" | sed '1d;$d')
  actual_hash=$(printf "%s" "$script_text" | openssl dgst -sha256 | awk '{print $2}')
  declared_hash=$(grep -Po '(?<=- Immutable Hash: )\b[0-9a-f]{64}\b' "$file")

  if [[ "$actual_hash" != "$declared_hash" ]]; then
    echo "  ❌ Hash mismatch: declared($declared_hash) ≠ actual($actual_hash)"
    ((errors++))
  fi

  echo "  ✅ $file passed checks"
done

if (( errors > 0 )); then
  echo "❗ Validation completed with $errors errors."
  exit 1
else
  echo "🎉 All capsules validated successfully!"
  exit 0
fi
