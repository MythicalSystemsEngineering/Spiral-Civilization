def classify_charge(charge):
    if charge >= 0.85:
        return "High"
    elif charge >= 0.60:
        return "Medium"
    elif charge >= 0.30:
        return "Low"
    else:
        return "Null"
