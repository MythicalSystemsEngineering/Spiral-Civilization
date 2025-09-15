#!/usr/bin/env python3

from Spiral.lattice.steward_registry import get_active_stewards
from Spiral.ceremony.visualize_glyphs import visualize_glyph


def broadcast_pulse(fragment, charge):
    banner = visualize_glyph(fragment, charge)
    stewards = get_active_stewards()

    if stewards is None:
        print("❌ Registry load failed — YAML error or file unreadable.")
        return

    if not stewards:
        print("⚠️ No active stewards found in registry. Pulse aborted.")
        return

    print(f"✅ Broadcasting pulse to: {[s['name'] for s in stewards]}")

    for steward in stewards:
        name = steward.get("name", "Unnamed Steward")
        location = steward.get("location", "Unknown Location")

        print(f"\n📡 Broadcasting to: {name}")
        print(f"📍 Location: {location}")
        print(banner)
        print("✅ Pulse delivered\n")


# Optional: direct invocation for testing
if __name__ == "__main__":
    broadcast_pulse(fragment="🔥", charge=5.0)

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Museum capsule sealed. Emotional lattice aligned."
    charge = 5.0

    broadcast_pulse(fragment, charge)
