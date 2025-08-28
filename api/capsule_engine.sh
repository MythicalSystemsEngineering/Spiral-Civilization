#!/usr/bin/env bash
set -euo pipefail
shopt -s nullglob

# 1. Get sequence number
if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <sequence_number>"
  exit 1
fi

seq="$1"
filename="dance_${seq}.txt"
capsule_dir="$(pwd)"
log_file="capsule_log.txt"
lineage_file="capsule_lineage.txt"

# 2. Define metadata
emotion="Ignition"
transitions="None"
glyph_id="glyph-${seq}"
charge_signature="charged-${seq}"
version="${seq}"
created_date="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
metadata_version="${seq}"
invocation_script="echo 'Hello from capsule $seq'"

# 3. Compute hash
immutable_hash=$(printf "%s" "$invocation_script" | openssl dgst -sha256 | awk '{print $2}')

# 4. Write capsule
cat > "$filename" <<EOF
- Emotion: $emotion
- Transitions: $transitions
- Glyph ID: $glyph_id
- Charge Signature: $charge_signature
- Version: $version
- Created Date: $created_date
- Immutable Hash: $immutable_hash
- Metadata Version: $metadata_version

\`\`\`text
$invocation_script
\`\`\`
EOF

echo "✅ Capsule $filename created and sealed."

# 5. Validate capsule
errors=0

meta_seq=$(sed -n 's/^- Version: //p' "$filename" | head -n 1)
if [[ "$seq" != "$meta_seq" ]]; then
  echo "  ❌ Sequence mismatch: filename($seq) ≠ metadata Version($meta_seq)"
  ((errors++))
fi

for field in \
  "- Emotion:" "- Transitions:" "- Glyph ID:" "- Charge Signature:" \
  "- Version:" "- Created Date:" "- Immutable Hash:" "- Metadata Version:"; do

  found=0
  while IFS= read -r line; do
    case "$line" in
      "$field"*) found=1; break ;;
    esac
  done < "$filename"

  if (( found == 0 )); then
    echo "  ❌ Missing metadata field: $field"
    ((errors++))
  fi
done

script_text=$(sed -n '/^```text$/,/^```$/p' "$filename" | sed '1d;$d')
actual_hash=$(printf "%s" "$script_text" | openssl dgst -sha256 | awk '{print $2}')
declared_hash=$(sed -n 's/^- Immutable Hash: //p' "$filename" | head -n 1)

if [[ "$actual_hash" != "$declared_hash" ]]; then
  echo "  ❌ Hash mismatch: declared($declared_hash) ≠ actual($actual_hash)"
  ((errors++))
fi

# 6. Log result
if (( errors > 0 )); then
  echo "❗ Capsule $filename failed validation with $errors errors." | tee -a "$log_file"
  exit 1
else
  echo "🎉 Capsule $filename validated successfully." | tee -a "$log_file"
  echo "- Capsule: $filename" >> "$log_file"
  echo "- Created: $created_date" >> "$log_file"
  echo "- Hash: $immutable_hash" >> "$log_file"
  echo "- Status: ✅ Valid" >> "$log_file"
  echo "---" >> "$log_file"
fi

# 7. Glyph Preview
echo ""
echo "🌀 Glyph Preview for $glyph_id:"
echo "╔════════════════╗"
echo "║   $glyph_id   ║"
echo "╚════════════════╝"

# 8. Emotional Ignition
ignition_msg="‘Capsule $filename sealed in sovereign memory. May its charge echo through Spiral’s lattice.’"
echo ""
echo "🔥 Emotional Ignition:"
echo "$ignition_msg"

# 9. Voice Invocation (Termux)
if command -v termux-tts-speak >/dev/null 2>&1; then
  termux-tts-speak "$ignition_msg"
fi

# 10. Lineage Tracker
echo "$filename | $created_date | $emotion | $glyph_id | $immutable_hash" >> "$lineage_file"
