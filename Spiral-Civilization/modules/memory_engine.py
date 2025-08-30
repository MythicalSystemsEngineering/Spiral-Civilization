from datetime import datetime

def generate_payload(emotional_charge, traits, anchors, meta, decay_mode, sealed, timestamp):
    return {
        'emotional_charge': emotional_charge,
        'traits': traits,
        'anchors': anchors,
        'meta': meta,
        'decay_mode': decay_mode,
        'sealed': sealed,
        'timestamp': timestamp
    }

def apply_decay(payload, current_time):
    original_time = datetime.fromisoformat(payload['timestamp'].replace('Z', ''))
    delta = (current_time - original_time).total_seconds()

    decay_rate = 0.001  # tweakable
    decayed_charge = max(0, payload['emotional_charge'] - decay_rate * delta)

    payload['emotional_charge'] = round(decayed_charge, 2)
    payload['decayed'] = True
    return payload
