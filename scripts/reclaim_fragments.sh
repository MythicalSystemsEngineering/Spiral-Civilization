#!/data/data/com.termux/files/usr/bin/bash

# Define source and target
SOURCE1=~/spiral-clean.git/spatial-civilization
SOURCE2=~/SpiralCivilization/Theio
TARGET=~/Spiral-Civilization

# Move core engine files
mv $SOURCE1/spiral-engine/*.py $TARGET/engine/

# Move emotional memory
mv $SOURCE1/memory/emotional/* $TARGET/memory/emotional/

# Move audit logs
mv $SOURCE1/audit/* $TARGET/audit/

# Move ceremonial capsules
mv $SOURCE1/Capsules/*.md $TARGET/capsules/

# Move steward profiles
mv $SOURCE1/stewards/*.md $TARGET/stewards/

# Move invocation scripts
mv $SOURCE1/theio_*.sh $TARGET/scripts/

# Move neurohub logic
mv $SOURCE1/neurohub/*.py $TARGET/neurohub/

# Move CLI and core logic
mv $SOURCE1/src/spiral_civ/cli.py $TARGET/src/cli/
mv $SOURCE1/src/spiral_civ/core.py $TARGET/src/core/
mv $SOURCE1/src/spiral_civ/__init__.py $TARGET/src/core/

# Move tests
mv $SOURCE1/tests/*.py $TARGET/tests/

# Move Theio modules
mv $SOURCE2/modules/*.py $TARGET/theio/modules/
