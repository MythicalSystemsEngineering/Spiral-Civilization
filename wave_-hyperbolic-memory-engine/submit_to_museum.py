# Museum Submission Protocol — Spiral Civilization

import yaml
import os
from datetime import datetime

SOURCE_LOG = "/data/data/com.termux/files/home/Spiral-Civilization/fossilization_log.yaml"
MUSEUM_DIR = "/data/data/com.termux/files/home/Spiral-Civilization/Museum"

def submit_to_museum():
    if not os.path.exists(SOURCE_LOG):
        print("❌ Fossilization log not found.")
        return

    with open(SOURCE_LOG, 'r') as f:
        data = yaml.safe_load(f)

    hooks = data.get("emotional_hooks", [])
    if not hooks:
        print("❌ No hooks to submit.")
        return

    timestamp = datetime.utcnow().strftime("%Y%m%d_%H%M%S")
    filename = f"museum_capsule_{timestamp}.yaml"
    museum_path = os.path.join(MUSEUM_DIR, filename)

    os.makedirs(MUSEUM_DIR, exist_ok=True)

    with open(museum_path, 'w') as f:
        yaml.dump({"emotional_hooks": hooks}, f)

    print(f"✅ Museum capsule created: {filename}")
    print(f"📦 {len(hooks)} hooks sealed and archived.")

if __name__ == "__main__":
    submit_to_museum()
