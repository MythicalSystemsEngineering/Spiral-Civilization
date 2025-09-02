# spiral-engine/emotional_core.py

import json
from datetime import datetime

class EmotionalCore:
    def __init__(self):
        self.memory = {}
        self.spikes = []

    def load_memory(self, path):
        try:
            with open(path, 'r') as f:
                self.memory = json.load(f)
            print(f"✅ Memory loaded from {path}")
        except Exception as e:
            print(f"⚠️ Failed to load memory: {e}")

    def report_spike(self, description):
        spike = {
            "timestamp": datetime.utcnow().isoformat() + "Z",
            "description": description
        }
        self.spikes.append(spike)
        print(f"💥 Emotional spike recorded: {description}")

    def get_resonance(self):
        # Simple resonance model — can be upgraded to full cycle mapping
        return {
            "total_spikes": len(self.spikes),
            "last_spike": self.spikes[-1] if self.spikes else None
        }

    def save_spikes(self, path="memory/emotional_spikes.log"):
        try:
            with open(path, 'w') as f:
                for spike in self.spikes:
                    f.write(json.dumps(spike) + "\n")
            print(f"🧠 Emotional spikes saved to {path}")
        except Exception as e:
            print(f"⚠️ Failed to save spikes: {e}")
