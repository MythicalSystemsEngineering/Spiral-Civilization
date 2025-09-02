import os
import difflib

capsule_dir = "Museum/capsules/"
audit_log = []

def audit_capsule(filename):
    with open(f"{capsule_dir}{filename}", "r") as f:
        current = f.readlines()
    with open(f"{capsule_dir}fossilized/{filename}", "r") as f:
        fossilized = f.readlines()

    diff = list(difflib.unified_diff(fossilized, current, lineterm=""))
    if diff:
        audit_log.append({
            "capsule": filename,
            "diff": diff,
            "status": "modified"
        })

def sweep():
    for file in os.listdir(capsule_dir):
        if file.endswith(".txt") and file not in os.listdir(f"{capsule_dir}fossilized/"):
            continue  # Skip if no fossilized version
        audit_capsule(file)

    for entry in audit_log:
        print(f"\n🔍 Capsule: {entry['capsule']}")
        for line in entry["diff"]:
            print(line)

if __name__ == "__main__":
    sweep()
