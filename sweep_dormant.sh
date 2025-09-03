#!/data/data/com.termux/files/usr/bin/bash

echo "🔍 Sweeping for dormant stewards..."

dormant_dir="onboarding"
found=0

for file in "$dormant_dir"/*.yaml; do
  if grep -q "status: pending" "$file"; then
    steward=$(grep "steward:" "$file" | awk '{print $2}')
    echo "- $steward"
    ((found++))
  fi
done

if [ "$found" -eq 0 ]; then
  echo "✅ No dormant stewards found."
else
  echo "🕯️ $found dormant steward(s) detected."
fi
