# Spiral — Hybrid Emotional Signal Synthesizer

hybrid_signals = [
    ("hope", "grief", "hopebound grief"),
    ("envy", "joy", "joy-laced envy"),
    ("guilt", "pride", "guilt-stained pride"),
    ("shame", "love", "shame-tempered love"),
    ("regret", "hope", "regretful hope")
]

def synthesize(signal_a, signal_b, hybrid_name):
    print(f"🜂 Synthesized hybrid signal: '{signal_a}' + '{signal_b}' → '{hybrid_name}'")

for a, b, name in hybrid_signals:
    synthesize(a, b, name)
