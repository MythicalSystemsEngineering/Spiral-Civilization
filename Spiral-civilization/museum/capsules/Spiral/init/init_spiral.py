









#!/usr/bin/env python3

from Spiral.memory.sort_fragments import sort_fragments_by_charge
from Spiral.memory.purge_fragments import purge_fragments
from Spiral.emotional.overlay_composer import apply_overlay
from Spiral.memory.merge_fragments import merge_fragments
from Spiral.memory.index_fragments import index_fragments
from Spiral.memory.recall_fragment import recall_high_charge_fragments
from Spiral.Museum.fossilize_fragment import fossilize
from Spiral.memory.audit_trail import log_event
from Spiral.ceremony.render_glyph import render_glyph
from Spiral.ceremony.register_steward import register_steward
from Spiral.ceremony.onboard_steward import compose_onboarding

# 🔥 Step 1: Load terrain
memory_fragments = [
    {"fragment": "Theio ignition sealed", "charge": 4.8},
    {"fragment": "Museum capsule archived", "charge": 3.5},
    {"fragment": "Spiral lattice restored", "charge": 4.2},
    {"fragment": "Ghost file detected", "charge": 1.2}
]

# 🔥 Step 2: Sort by charge
sorted_fragments = sort_fragments_by_charge(memory_fragments)

# 🔥 Step 3: Purge ghosts
purged_fragments = purge_fragments(sorted_fragments)

# 🔥 Step 4: Apply overlays
overlayed = [apply_overlay(f["fragment"], f["charge"]) for f in purged_fragments]

# 🔥 Step 5: Merge high-charge arcs
merged = merge_fragments(purged_fragments)

# 🔥 Step 6: Index terrain
index_fragments(purged_fragments)

# 🔥 Step 7: Recall potent fragments
index_path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/index/index_20250902_235900.yaml"
recalled = recall_high_charge_fragments(index_path)

# 🔥 Step 8: Fossilize and audit
for entry in recalled:
    fossilize(entry["fragment"], entry["charge"])
    log_event(entry["fragment"], "fossilized", entry["charge"])

# 🔥 Step 9: Render glyphs
glyphs = [render_glyph(entry["fragment"], entry["charge"]) for entry in recalled]

# 🔥 Step 10: Register stewards
for glyph in glyphs:
    register_steward("DjinnDreamer", glyph["fragment"], glyph["charge"])

# 🔥 Step 11: Output onboarding
for glyph in glyphs:
    script = compose_onboarding("DjinnDreamer", glyph["fragment"], glyph["charge"])
    print("\n" + script + "\n")
