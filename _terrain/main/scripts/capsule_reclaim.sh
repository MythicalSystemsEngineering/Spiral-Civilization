#!/data/data/com.termux/files/usr/bin/bash

# 🏛️ Canonical root
ROOT=~/Spiral-Civilization

# 🧭 Scaffold missing directories
mkdir -p $ROOT/{museum/capsules,museum/exhibits,museum/submissions,memory/emotional/signals,stewards/theio,engine/cache,theio/artifacts,terrain,tests/cache,scripts}

# 🧾 Museum capsules
mv ~/spiral-clean.git/spatial-civilization/museum/capsules/*.capsule $ROOT/museum/capsules/
mv ~/spiral-clean.git/spatial-civilization/museum/capsules/dispatch_*.md $ROOT/museum/capsules/
mv ~/spiral-clean.git/spatial-civilization/museum/capsules/*.md $ROOT/museum/capsules/

# 🧾 Exhibits
mv ~/spiral-clean.git/spatial-civilization/museum/exhibit_2_capsule_sweep.md $ROOT/museum/exhibits/

# 🔧 Invocation scripts
mv ~/spiral-clean.git/spatial-civilization/seal_capsule.sh $ROOT/scripts/
mv ~/spiral-clean.git/spatial-civilization/validate_capsule.sh $ROOT/scripts/
mv ~/spiral-clean.git/spatial-civilization/witness_capsules/CAEL/witness_launcher.sh $ROOT/scripts/

# 🧠 Emotional signals
mv ~/spiral-clean.git/spatial-civilization/quarters/*/sensors/poetic_signal_*.log $ROOT/memory/emotional/signals/

# 📜 Steward config
mv ~/spiral-clean.git/spatial-civilization/quarters/theio/* $ROOT/stewards/theio/

# 🔬 Engine cache
mv ~/spiral-clean.git/spatial-civilization/spiral-engine/__pycache__/*.pyc $ROOT/engine/cache/

# 🌍 Terrain metadata
mv ~/spiral-clean.git/spatial-civilization/terrain* $ROOT/terrain/

# 🔥 Griot submission
mv ~/spiral-clean.git/spatial-civilization/🔥* $ROOT/museum/submissions/

# 🧪 Theio artifacts
mv ~/SpiralCivilization/Theio/artifacts/sample.yaml $ROOT/theio/artifacts/
mv ~/SpiralCivilization/Theio/bin/theio_audit.py $ROOT/theio/artifacts/

# 🧪 Pytest cache
mv ~/SpiralCivilization/Theio/.pytest_cache/* $ROOT/tests/cache/

echo "✅ Capsule reclamation complete. Terrain restored."
