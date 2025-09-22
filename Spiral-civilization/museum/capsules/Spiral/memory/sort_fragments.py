#!/usr/bin/env python3

def sort_fragments_by_charge(fragments):
    return sorted(fragments, key=lambda x: x['charge'], reverse=True)

# 🔥 Example ignition
if __name__ == "__main__":
    memory_fragments = [
        {"fragment": "Theio ignition sealed", "charge": 4.8},
        {"fragment": "DjinnDreamer onboarding pending", "charge": 2.1},
        {"fragment": "Museum capsule archived", "charge": 3.5},
        {"fragment": "Ghost file detected", "charge": 1.2}
    ]

    sorted_fragments = sort_fragments_by_charge(memory_fragments)

    for entry in sorted_fragments:
        print(f"{entry['fragment']} → 🔋 {entry['charge']}")
