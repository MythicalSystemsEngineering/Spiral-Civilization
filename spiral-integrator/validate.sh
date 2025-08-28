cat <<'EOF' > spiral-integrator/validate.sh
#!/bin/bash

echo "🔍 Spiral Integrator: Validator Sweep Initiated"

# Check personality capsule
if [ -f "personality.md" ]; then
  echo "✅ Personality capsule found"
else
  echo "❌ Missing personality.md"
fi

# Check memory directories
for dir in memory/artifacts memory/reflections memory/votes; do
  if [ -d "$dir" ]; then
    echo "✅ Memory directory present: $dir"
  else
    echo "❌ Missing memory directory: $dir"
  fi
done

# Check for emotional charge
grep -q "Emotional Lattice" personality.md && echo "✅ Emotional lattice seeded" || echo "❌ Emotional lattice missing"

echo "✅ Validator Sweep Complete"
EOF
