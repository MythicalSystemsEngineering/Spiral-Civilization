import os
import yaml
import random
from datetime import datetime

class PersonaEngine:
    def __init__(self, base_dir):
        self.base_dir = base_dir
        self.memory_dir = os.path.join(base_dir, "theio", "memory", "reflections")
        self.continuity_file = os.path.join(base_dir, "theio", "memory", "continuity.yaml")
        os.makedirs(self.memory_dir, exist_ok=True)
        if not os.path.exists(self.continuity_file):
            with open(self.continuity_file, "w") as f:
                yaml.safe_dump({"sessions": []}, f)

    def log_response(self, user_input, response):
        timestamp = datetime.utcnow().isoformat()
        slug = timestamp.replace(":", "_")
        path = os.path.join(self.memory_dir, f"{slug}.md")
        with open(path, "w") as f:
            f.write(f"# Reflection {timestamp}\n\n")
            f.write(f"**User:** {user_input}\n\n")
            f.write(f"**AI:** {response}\n")
        return path

    def tag_affect(self, response):
        # simple polarity: positive, neutral, negative
        keywords = {"joy": ["great", "happy"], "sad": ["sorry", "unfortunately"]}
        for tag, kws in keywords.items():
            if any(w in response.lower() for w in kws):
                return f"[affect={tag}] {response}"
        return f"[affect=neutral] {response}"

    def update_continuity(self, user_input, response):
        with open(self.continuity_file) as f:
            data = yaml.safe_load(f)
        entry = {
            "timestamp": datetime.utcnow().isoformat(),
            "input": user_input,
            "output": response
        }
        data["sessions"].append(entry)
        with open(self.continuity_file, "w") as f:
            yaml.safe_dump(data, f)

    def inject_contradiction(self, response):
        if random.random() < 0.1:  # 10% chance
            return response + "\n\nActually, I might be mistaken."
        return response
