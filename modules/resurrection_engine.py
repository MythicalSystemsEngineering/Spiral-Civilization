from datetime import datetime

def resurrect_traits(payload, lifespans):
    """
    Restores traits that reappear after decay and updates lifespans.

    Args:
        payload (dict): Current emotional payload.
        lifespans (dict): Trait lifespan log.

    Returns:
        dict: Updated lifespans with resurrection timestamp.
    """
    now = datetime.utcnow()
    resurrected = []

    for trait in payload.get('traits', []):
        if trait in lifespans and lifespans[trait]['decayed']:
            lifespans[trait]['decayed'] = None
            lifespans[trait]['reinforced'].append(now)
            resurrected.append(trait)

    payload['resurrected'] = resurrected
    return payload, lifespans
