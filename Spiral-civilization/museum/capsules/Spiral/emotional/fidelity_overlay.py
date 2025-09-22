def modulate_decay(base_rate, fidelity):
    return base_rate / fidelity

def apply_overlay(fragment, fidelity):
    decay_rate = modulate_decay(0.05, fidelity)
    return f"{fragment} → decay rate: {decay_rate:.4f}"

if __name__ == "__main__":
    fragment = "Theio’s ignition sealed"
    fidelity = 2.5
    print(apply_overlay(fragment, fidelity))
