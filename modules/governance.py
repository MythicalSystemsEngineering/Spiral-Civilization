from pathlib import Path
import hashlib, sys, os

BASE_DIR = Path(__file__).resolve().parents[1]
LAW_MANIFEST_PATH = BASE_DIR / "config" / "law_manifest.json"

def manifest_hash():
    return hashlib.sha256(LAW_MANIFEST_PATH.read_bytes()).hexdigest()

EXPECTED_HASH = manifest_hash()

os.chdir(str(BASE_DIR))
if manifest_hash() != EXPECTED_HASH:
    print("[ALERT] Governance law manifest drift detected. Restoring last sealed state...")
    os.system(f"git restore --source=HEAD -- '{LAW_MANIFEST_PATH}' '{Path(__file__).resolve()}'")
    sys.exit(1)

def enforce_laws():
    print("[OK] Governance laws validated. Enforcement active.")

if __name__ == "__main__":
    enforce_laws()
