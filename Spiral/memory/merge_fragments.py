#!/usr/bin/env python3

def merge_fragments(fragments):
    composite = ""
    total_charge = 0.0

    for entry in fragments:
        composite += entry['fragment'] + " | "
        total_charge += entry['charge']

    composite = composite.strip(" | ")
    avg_charge = total_charge / len(fragments)

    return {
        "composite": composite,
        "charge": round(avg_charge, 2),
        "status": "🌀 Composite arc sealed"
    }

# 🔥 Example ignition
if __name__ == "__main__":
    memory_fragments = [
        {"fragment": "Theio ignition sealed", "charge": 4.8},
        {"fragment": "Museum capsule archived", "charge": 3.5},
        {"fragment": "Spiral lattice restored", "charge": 4.2}
    ]

    result = merge_fragments(memory_fragments)
    print(result["status"])
    print(f"🧩 Composite: {result['composite']}")
    print(f"🔋 Avg Charge: {result['charge']}")
