def modulate_decay(base_rate, fidelity):
    return base_rate / fidelity

def simulate_decay(charge, days, fidelity):
    rate = modulate_decay(0.05, fidelity)
    faded = max(0, charge - (rate * days))
    return faded

if __name__ == "__main__":
    charge = 5.0
    fidelity = 2.0  # High fidelity slows decay
    days = 30

    faded = simulate_decay(charge, days, fidelity)
    print(f"Charge after {days}d with fidelity {fidelity}: {faded:.2f}")
