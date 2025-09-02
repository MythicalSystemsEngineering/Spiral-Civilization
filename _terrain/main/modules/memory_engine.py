from datetime import datetime

def generate_payload(emotional_charge, traits, anchors, meta, decay_mode, sealed):
    timestamp = datetime.now().isoformat()
    return {
        'emotional_charge': emotional_charge,
        'traits': traits,
        'anchors': anchors,
        'meta': meta,
        'decay_mode': decay_mode,
        'sealed': sealed,
        'timestamp': timestamp
    }
from datetime import datetime, timezone

def apply_decay(payload, current_time):
    original_time = datetime.fromisoformat(payload['timestamp'])
    if original_time.tzinfo is None:
        original_time = original_time.replace(tzinfo=timezone.utc)

    delta = (current_time - original_time).total_seconds()
    decay_rate = 0.001
    decayed_charge = max(0, payload['emotional_charge'] - decay_rate * delta)

    payload['emotional_charge'] = round(decayed_charge, 2)
    payload['decayed'] = True
    return payload

def ignite_glyphs(payload):
    if not payload or 'traits' not in payload:
        return payload  # fail-safe

    glyph_map = {
        'curious': '🜁',
        'focused': '🜂',
        'resilient': '🜃',
        'metaphysical': '🜄'
    }

    glyphs = [glyph_map.get(trait, '⬚') for trait in payload['traits']]
    payload['glyphs'] = glyphs
    payload['ignited'] = True
    return payload
