def log_reflection(response_text, charge, drift_flag):
    with open("memory/emotional/self_reflection.log", "a") as log:
        log.write(f"Response: {response_text}\n")
        log.write(f"Charge: {charge} | Drift: {drift_flag}\n")
        log.write("— — —\n")
