def emotional_charge():
    return 0.97

def eqi_assess():
    Payload = {"intensity": 0.97}
    charge = emotional_charge()
    result = Payload["intensity"] * charge
    return result

if __name__ == "__main__":
    print(eqi_assess())
