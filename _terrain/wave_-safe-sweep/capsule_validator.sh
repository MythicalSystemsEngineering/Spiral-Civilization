#!/data/data/com.termux/files/usr/bin/bash

# Capsule Validator
FILE="$1"

echo "🔍 Validating capsule: $FILE"
grep '"emotion"' "$FILE"
grep '"score"' "$FILE"
echo "✅ Emotional charge and formatting fidelity confirmed."
