#!/bin/bash

INDEX_PATH="Museum/Capsules/Hooks/meta_reflection_index.v1.0.yaml"

if [ -f "$INDEX_PATH" ]; then
  sed -i 's/sealed: false/sealed: true/g' "$INDEX_PATH"
  echo "✅ All entries sealed in $INDEX_PATH"
else
  echo "❌ Index not found at $INDEX_PATH"
fi
