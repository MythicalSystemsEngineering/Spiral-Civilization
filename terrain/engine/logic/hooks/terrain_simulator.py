# Spiral — External Terrain Simulator
external_signals = [
    ("envy", "assertion"),
    ("hope", "pause and fossilization"),
    ("shame", "forward propagation"),
    ("love", "rollback")
]

def simulate(signal, logic_state):
    print(f"🜂 External signal '{signal}' vs logic state '{logic_state}' — flare triggered")

for signal, state in external_signals:
    simulate(signal, state)
