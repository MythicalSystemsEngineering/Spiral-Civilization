#!/bin/bash
for file in capsules/*.md; do
  sed -i '1i# Ceremonial Declaration: Sovereign Capsule\n@emotion: ignition\n@steward: Daniel Lightfoot\n@version: v1.0\n' "$file"
  echo "🔧 Injected ceremonial header into: $file"
done
