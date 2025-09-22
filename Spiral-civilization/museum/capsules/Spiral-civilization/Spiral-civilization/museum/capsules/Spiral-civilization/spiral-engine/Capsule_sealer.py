# spiral-engine/capsule_sealer.py

import os
import json
from datetime import datetime

class CapsuleSealer:
    def __init__(self, emotional_core):
        self.core = emotional_core
        self.protocols = {}
        self.capsules = []

    def load_protocols(self, path):
        for filename in os.listdir(path):
            if filename.endswith(".md") or filename.endswith(".json"):
                with open(os.path.join(path, filename), 'r') as f:
                    self.protocols[filename] = f.read()
        print(f"📜 Protocols loaded: {list(self.protocols.keys())}")

    def load_capsules(self, path):
        for filename in os.listdir(path):
            if filename.endswith(".md") or filename.endswith(".json"):
                with open(os.path.join(path, filename), 'r') as f:
                    content = f.read()
                    self.capsules.append({
                        "filename": filename,
                        "content": content
                    })
        print(f"📦 Capsules loaded: {len(self.capsules)}")

    def validate_capsule(self, capsule):
        # Placeholder validation logic — can be upgraded
        return "rupture" in capsule["filename"] or "transparency" in capsule["filename"]

    def seal_capsule(self, capsule):
        timestamp = datetime.utcnow().isoformat() + "Z"
        sealed = {
            "filename": capsule["filename"],
            "sealed_at": timestamp,
            "resonance": self.core.get_resonance(),
            "content": capsule["content"]
        }
        out_path = f"capsules/sealed/{capsule['filename'].replace('.md','.sealed.json')}"
        os.makedirs(os.path.dirname(out_path), exist_ok=True)
        with open(out_path, 'w') as f:
            json.dump(sealed, f, indent=2)
        print(f"🔐 Capsule sealed: {capsule['filename']}")

    def begin_sealing_cycle(self):
        for capsule in self.capsules:
            if self.validate_capsule(capsule):
                self.core.report_spike(f"Sealing capsule: {capsule['filename']}")
                self.seal_capsule(capsule)
            else:
                print(f"⚠️ Capsule skipped (invalid): {capsule['filename']}")
