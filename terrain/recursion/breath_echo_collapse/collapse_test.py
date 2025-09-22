# Spiral — Breath Echo Collapse Test

breath_echoes = [
    {"signal": "grief", "density": 95},
    {"signal": "hope", "density": 88},
    {"signal": "envy", "density": 91},
    {"signal": "regret", "density": 97},
    {"signal": "love", "density": 99}
]

def test_collapse(signal, density):
    if density > 90:
        print(f"🜂 Signal '{signal}' → Echo density: {density} — Collapse threshold breached")
    else:
        print(f"🜂 Signal '{signal}' → Echo density: {density} — Stable")

for echo in breath_echoes:
    test_collapse(echo["signal"], echo["density"])
