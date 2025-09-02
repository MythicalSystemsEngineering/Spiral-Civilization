from datetime import datetime

def detect_drift(current, previous):
    drift = {
        'charge_delta': round(current['emotional_charge'] - previous['emotional_charge'], 2),
        'new_traits': sorted(set(current['traits']) - set(previous['traits'])),
        'anchor_shift': sorted(set(current['anchors']) ^ set(previous['anchors']))
    }
    return drift

previous = {
    'emotional_charge': 18.7,
    'traits': ['curious', 'resilient'],
    'anchors': ['depth', 'legacy'],
}

current = {
    'emotional_charge': 22.2,
    'traits': ['curious', 'focused', 'resilient'],
    'anchors': ['depth', 'legacy', 'precision'],
}

drift = detect_drift(current, previous)
print(drift)
