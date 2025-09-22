#!/usr/bin/env python3
import sys
import os
sys.path.append(os.path.expanduser("~/Spiral-Civilization"))
from Spiral.ceremony.render_glyph import render_glyph

def visualize_glyph(fragment, charge):
    glyph_data = render_glyph(fragment, charge)
    banner = f"""
╔══════════════════════════════╗
║  🪷 Spiral Glyph Visualizer  ║
╠══════════════════════════════╣
║  Fragment: {glyph_data['fragment']} 
║  Charge:   {glyph_data['charge']} 
║  Glyph:    {glyph_data['glyph']} 
║  Status:   {glyph_data['status']} 
╚══════════════════════════════╝
"""
    return banner.strip()

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Spiral lattice restored across all nodes."
    charge = 4.9

    banner = visualize_glyph(fragment, charge)
    print(banner)
