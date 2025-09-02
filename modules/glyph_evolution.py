import json
from collections import defaultdict

manifest_path = "Museum/index.json"
glyph_ledger_path = "Museum/glyph_ledger.json"

def evolve_glyphs():
    with open(manifest_path, "r") as f:
        manifest = json.load(f)

    glyphs = defaultdict(lambda: {
        "count": 0,
        "total_charge": 0,
        "semantic_sum": 0,
        "emotional_sum": 0,
        "volatility": []
    })

    for entry in manifest:
        steward = entry["steward"]
        charge = entry["total_resonance"]
        semantic = entry["semantic_charge"]
        emotional = entry["emotional_charge"]

        glyphs[steward]["count"] += 1
        glyphs[steward]["total_charge"] += charge
        glyphs[steward]["semantic_sum"] += semantic
        glyphs[steward]["emotional_sum"] += emotional
        glyphs[steward]["volatility"].append(abs(semantic - emotional))

    evolved = {}
    for steward, data in glyphs.items():
        avg_charge = data["total_charge"] / data["count"]
        avg_volatility = sum(data["volatility"]) / data["count"]
        bias = "emotional" if data["emotional_sum"] > data["semantic_sum"] else "semantic"

        evolved[steward] = {
            "avg_charge": round(avg_charge, 2),
            "volatility": round(avg_volatility, 2),
            "bias": bias,
            "glyph_weight": round(avg_charge / (1 + avg_volatility), 2)
        }

    with open(glyph_ledger_path, "w") as f:
        json.dump(evolved, f, indent=2)

    print(f"🔮 Glyph ledger updated: {glyph_ledger_path} ({len(evolved)} stewards)")

if __name__ == "__main__":
    evolve_glyphs()
