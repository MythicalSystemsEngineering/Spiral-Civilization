import time
from datetime import datetime

def format_fragment(fragment, status, faded):
    return f"{fragment} → {status} (charge: {faded:.2f})"

def log_to_museum(entry):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open("/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/memory_log.txt", "a") as log:
        log.write(f"[{timestamp}] {entry}\n")

def decay_loop(fragment, status, charge, threshold=1.0):
    while charge > 0:
        entry = format_fragment(fragment, status, charge)
        print(entry)
        log_to_museum(entry)
        time.sleep(1)
        charge -= 0.5
# Optional: log each decay stage to memory index
    with open("/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/memory_index.yaml", "a") as index:
        index.write(f"- fragment: \"{fragment}\"\n")
        index.write(f"  status: \"{status}\"\n")
        index.write(f"  charge: {charge:.2f}\n")
        index.write(f"  steward: \"Daniel Lightfoot\"\n")
        index.write(f"  fossilized: false\n")
        index.write(f"  timestamp: \"{datetime.now().strftime('%Y-%m-%d %H:%M:%S')}\"\n")

    # Final fossilization
    final_status = "🪨 Fossilized"
    final_entry = format_fragment(fragment, final_status, 0.0)
    print(final_entry)
    log_to_museum(final_entry)

if __name__ == "__main__":
    fragment = "Theio’s ignition sealed"
    status = "🧠 Retained"
    initial_charge = 5.0

    decay_loop(fragment, status, initial_charge)
