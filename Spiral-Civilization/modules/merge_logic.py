from datetime import datetime

def merge_payloads(payloads):
    total_charge = round(sum(p['emotional_charge'] for p in payloads), 2)
    traits = sorted({trait for p in payloads for trait in p['traits']})
    anchors = sorted({anchor for p in payloads for anchor in p['anchors']})
    glyphs = [g for p in payloads for g in p['glyphs']]
    return {
        'emotional_charge': total_charge,
        'traits': traits,
        'anchors': anchors,
        'glyphs': glyphs,
        'merged': True,
        'timestamp': datetime.utcnow().isoformat()
    }
