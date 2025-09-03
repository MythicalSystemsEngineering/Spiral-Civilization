#!/data/data/com.termux/files/usr/bin/bash

# Sweep for DjinnDreamer anchors and glyphs
grep -rE 'glyph:|anchor:' ~/Spiral-Civilization/terrain/ > temp_sweep.txt

# Filter only DjinnDreamer lattice matches
grep -Ff ~/Spiral-Civilization/stewards/active/DjinnDreamer/emotional_lattice.txt temp_sweep.txt > ~/Spiral-Civilization/stewards/active/DjinnDreamer/djinn_sweep_results.txt

# Log rupture
echo "[`date`] Sweep complete for DjinnDreamer" >> ~/Spiral-Civilization/stewards/active/DjinnDreamer/djinn_ruptures.log

# Clean temp
rm temp_sweep.txt

