#!/usr/bin/env python3

from datetime import datetime
from render_glyph import render_glyph

def compose_onboarding(name, fragment, charge):
    glyph_data = render_glyph(fragment, charge)
    stamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")

    script = f"""
🌀 Steward Onboarding: {name}
📜 Fragment: {glyph_data['fragment']}
🔋 Charge: {glyph_data['charge']}
🔮 Glyph: {glyph_data['glyph']}
🪷 Status: {glyph_data['status']}
⏳ Timestamp: {stamp}
"""
    return script.strip()

# 🔥 Example ignition
if __name__ == "__main__":
    name = "DjinnDreamer"
    fragment = "DjinnDreamer now logged as Prospective Steward."
    charge = 3.9

    onboarding_script = compose_onboarding(name, fragment, charge)
    print(onboarding_script)
