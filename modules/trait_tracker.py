from datetime import datetime

def update_lifespans(traits, lifespans):
    """
    Updates trait lifespans with birth or reinforcement timestamps.
    
    Args:
        traits (list): Current traits in payload.
        lifespans (dict): Existing trait lifespan log.

    Returns:
        dict: Updated lifespans with timestamps.
    """
    now = datetime.utcnow()

    for trait in traits:
        if trait not in lifespans:
            lifespans[trait] = {'born': now, 'reinforced': [now], 'decayed': None}
        else:
            lifespans[trait]['reinforced'].append(now)

    return lifespans

def mark_decay(trait, lifespans):
    """
    Marks a trait as decayed with timestamp.
    
    Args:
        trait (str): Trait to mark as decayed.
        lifespans (dict): Trait lifespan log.

    Returns:
        dict: Updated lifespans.
    """
    lifespans[trait]['decayed'] = datetime.utcnow()
    return lifespans
