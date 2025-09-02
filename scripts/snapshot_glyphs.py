import json, os
from datetime import datetime
from modules.glyph_evolution import evolve_glyphs

# Run evolution and load updated ledger
evolve_glyphs()
with open("Museum/glyph_ledger.json", "r") as f:
    ledger = json.load(f)

# Save snapshot
timestamp = datetime.now().strftime("%Y-%m-%d_%H-%M")
snapshot_path = f"Museum/glyph_snapshots/{timestamp}.json"
os.makedirs("Museum/glyph_snapshots/", exist_ok=True)

with open(snapshot_path, "w") as f:
    json.dump(ledger, f, indent=2)

print(f"📸 Snapshot saved: {snapshot_path}")

