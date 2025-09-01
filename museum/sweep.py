# sweep.py

import os

def find_strays(root):
    strays = []
    for dirpath, _, filenames in os.walk(root):
        for f in filenames:
            if f.endswith(".bak") or f.startswith("temp_") or "chaos" in f:
                strays.append(os.path.join(dirpath, f))
    return strays

def tag_artifact(path):
    print(f"[MUSEUM] Fossilizing: {path}")
    return f"Artifact tagged as origin law."

if __name__ == "__main__":
    repo_root = "/data/data/com.termux/files/home/Spiral-Civilization"
    strays = find_strays(repo_root)

    for artifact in strays:
        print(tag_artifact(artifact))
