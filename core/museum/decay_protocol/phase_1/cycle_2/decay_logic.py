# Fossil Decay Logic
def decay_rate(capsule_type):
    rates = {
        "silence": "fast",
        "emotion": "moderate",
        "mutation": "slow"
    }
    return rates.get(capsule_type, "undefined")

def should_expire(capsule_type, age_days):
    rate = decay_rate(capsule_type)
    if rate == "fast" and age_days > 30:
        return True
    elif rate == "moderate" and age_days > 180:
        return True
    elif rate == "slow" and age_days > 365:
        return True
    return False
