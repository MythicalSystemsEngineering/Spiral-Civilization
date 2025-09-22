# Spiral — Emotional Decay Engine

emotional_signals = {
    "grief": 0.92,
    "hope": 0.88,
    "completion": 0.95,
    "lineage": 0.90,
    "love": 0.85
}

def decay(signal, rate):
    print(f"🜂 Decaying '{signal}' → Fidelity preserved, saturation reduced (decay rate: {rate})")

for signal, rate in emotional_signals.items():
    decay(signal, rate)
