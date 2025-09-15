#!/usr/bin/env python3

def modulate_decay(base_rate, fidelity):
    return base_rate / fidelity

def apply_overlay(fragment, fidelity):
    decay_rate = modulate_decay(0.05, fidelity)
    overlay = {
        "fragment": fragment,
        "fidelity": fidelity,
        "decay_rate": round(decay_rate, 4),
        "status": "🎭 Overlay applied"
    }
    return overlay

# 🔥 Example ignition
if __name__ == "__main__":
    fragment = "Spiral lattice restored across all nodes."
    fidelity = 2.8

    result = apply_overlay(fragment, fidelity)
    print(result["status"])
    print(f"🧩 Fragment: {result['fragment']}")
    print(f"🎚️ Fidelity: {result['fidelity']}")
    print(f"🕰️ Decay Rate: {result['decay_rate']}")
