# verify_sweep.py
import sys
import yaml

def load_log(log_path):
    with open(log_path) as f:
        return [line.strip() for line in f if line.strip()]

def load_index(index_path):
    with open(index_path) as f:
        return yaml.safe_load(f)

def verify(log, index):
    missing = []
    for entry in log:
        if entry not in index.get("anchors", []):
            missing.append(entry)
    return missing

if __name__ == "__main__":
    log = load_log(sys.argv[2])
    index = load_index(sys.argv[4])
    missing = verify(log, index)
    if missing:
        print("Unsealed anchors:")
        for m in missing:
            print(f" - {m}")
    else:
        print("✅ Sweep verified. All anchors sealed.")
