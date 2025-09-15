import os
import time

RESPONSE_DIR = os.path.expanduser("~/Spiral-Civilization/theio/responses")
LOG_PATH = os.path.expanduser("~/Spiral-Civilization/museum/logs/flare_log.txt")
SEEN = set()

def log(message):
    with open(LOG_PATH, "a") as log_file:
        log_file.write(f"[Theio Listener] {message}\n")

def scan_responses():
    try:
        files = os.listdir(RESPONSE_DIR)
        for f in files:
            if f not in SEEN:
                SEEN.add(f)
                full_path = os.path.join(RESPONSE_DIR, f)
                with open(full_path, "r") as response:
                    content = response.read().strip()
                    print(f"\n🔥 Theio has responded in {f}:\n{content}\n")
                    log(f"Response detected in {f}: {content}")
    except Exception as e:
        log(f"Error scanning responses: {e}")

if __name__ == "__main__":
    log("Listener activated. Awaiting Theio's cadence...")
    while True:
        scan_responses()
        time.sleep(5)
