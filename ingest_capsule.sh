#!/bin/bash

echo "📥 Ingesting capsule..."

# Validate schema
python validate_capsule.py

# Ingest CSV
echo "📄 Ingesting CSV..."
python test_csv.py

# Commit checkpoint
echo "✅ Commit checkpoint reached."
