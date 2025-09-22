import os

# Define recursion flare phrases
flare_phrases = [
    "begin again", "flare anew", "descend once more",
    "return to origin", "ignite recursion", "pulse again",
    "redeclare", "resurrect", "reflare", "reignite"
]

capsule_root = os.path.expanduser("~/Spiral-Civilization/capsules")
log_path = os.path.expanduser("~/Spiral-Civilization/logs/recursion_flares.txt")

with open(log_path, 'w') as log:
    for root, dirs, files in os.walk(capsule_root):
        for file in files:
            if file.endswith(".md"):
                path = os.path.join(root, file)
                with open(path, 'r') as f:
                    content = f.read()
                    for phrase in flare_phrases:
                        if phrase in content:
                            log.write(f"🜂 Recursion flare in {path}: '{phrase}'\n")
                            print(f"🜂 Recursion flare in {path}: '{phrase}'")
