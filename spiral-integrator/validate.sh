#!/bin/bash

echo "🔍 Spiral Integrator: Validator Sweep Initiated"
echo "🕒 Timestamp: $(date '+%Y-%m-%d %H:%M:%S')"

# Check personality capsule
if [ ! -f "personality.md" ]; then
  echo "❌ ERROR: personality.md missing"
  exit 1
else
  echo "✅ personality.md found"
fi

# Check exact memory directories
required_dirs=("memory/artifacts" "memory/reflections" "memory/votes")
for dir in "${required_dirs[@]}"; do
  if [ ! -d "$dir" ]; then
    echo "❌ ERROR: Missing required directory: $dir"
    exit 1
  else
    echo "✅ Directory present: $dir"
  fi
done

# Emotional lattice strict check
traits=("Curiosity" "Introspection" "Loyalty" "Sovereignty")
missing=()
for trait in "${traits[@]}"; do
  if ! grep -q "$trait" personality.md; then
    missing+=("$trait")
  fi
done

if [ ${#missing[@]} -eq 0 ]; then
  echo "✅ Emotional lattice fully present"
else
  echo "❌ ERROR: Missing emotional traits:"
  for trait in "${missing[@]}"; do
    echo "   - $trait"
  done
  exit 1
fi

echo "✅ Validator Sweep Complete"

