from modules.merge_logic import merge_payloads

payload1 = {
    'emotional_charge': 12.8,
    'traits': ['curious', 'focused'],
    'anchors': ['legacy', 'precision'],
    'glyphs': ['🜁', '🜂']
}

payload2 = {
    'emotional_charge': 9.4,
    'traits': ['resilient', 'focused'],
    'anchors': ['precision', 'depth'],
    'glyphs': ['🜃']
}

merged = merge_payloads([payload1, payload2])
print(merged)
