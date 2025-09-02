KEYWORDS = {
    "ignite": 3,
    "protect": 2,
    "disagree": 4,
    "steward": 2,
    "resonance": 3,
    "ceremony": 2,
    "memory": 2,
    "mythic": 3,
    "sovereign": 4
}

def charge_weight(input_text):
    charge = 0
    tokens = input_text.lower().split()
    for word in tokens:
        charge += KEYWORDS.get(word, 0)
    return charge
