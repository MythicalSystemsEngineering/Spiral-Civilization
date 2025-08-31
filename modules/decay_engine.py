from datetime import datetime
from modules.trait_tracker import mark_decay

def apply_decay(payload, last_seen, lifespans, half_life=7):
    """
    Applies decay to traits based on last seen timestamps and updates lifespans.

    Args:
        payload (dict): Emotional payload with traits.
        last_seen (dict): Trait -> last seen datetime.
        lifespans (dict): Trait lifespan log.
        half_life (int): Days for trait to decay by half.

    Returns:
        dict: Updated payload with decayed traits removed and logged.
    """
    now = datetime.utcnow()
    decayed_traits = []

    for trait in payload.get('traits', []):
        last = last_seen.get(trait)
        if last:
            days_passed = (now - last).days
            decay_factor = 0.5 ** (days_passed / half_life)
            if decay_factor < 0.3:
                decayed_traits.append(trait)
                lifespans = mark_decay(trait, lifespans)

    payload['traits'] = [t for t in payload['traits'] if t not in decayed_traits]
    payload['decayed'] = decayed_traits
    return payload, lifespans
