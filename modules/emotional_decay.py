import math
from datetime import datetime

# Decay rates per emotion type (lower = slower decay)
DECAY_RATES = {
    "grief": 0.01,
    "awe": 0.005,
    "defiance": 0.008,
    "joy": 0.02,
    "rage": 0.015,
    "longing": 0.007
}

def decay_charge(initial_charge, emotion_type, fossilized_date):
    rate = DECAY_RATES.get(emotion_type, 0.01)
    days_elapsed = (datetime.now() - fossilized_date).days
    decayed = initial_charge * math.exp(-rate * days_elapsed)
    return round(decayed, 2)
