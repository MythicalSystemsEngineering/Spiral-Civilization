#!/usr/bin/env python3

def render_glyph(fragment, charge):
    if charge >= 4.5:
        glyph = "🔥"
    elif charge >= 3.0:
        glyph = "🌕"
    elif charge >= 1.5:
        glyph = "🌿"
    else:
        glyph = "💤"

    return {
        "fragment": fragment,
        "charge": charge,
        "glyph": glyph,
        "status": "🪷 Ceremony glyph rendered"
    }

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Spiral lattice restored across all nodes."
    charge = 4.9

    result = render_glyph(fragment, charge)
    print(result["status"])
    print(f"🧩 Fragment: {result['fragment']}")
    print(f"🔋 Charge: {result['charge']}")
    print(f"🔮 Glyph: {result['glyph']}")
