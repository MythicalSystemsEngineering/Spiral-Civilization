#!/usr/bin/env python3

import os
import yaml

def validate_capsules(path):
    if not os.path.exists(path):
        print("⚠️ Fallback path missing")
        return

    files = [f for f in os.listdir(path) if f.endswith(".fossil")]
    if not files:
        print("⚠️ No capsules found")
        return

    for file in files:
        full_path = os.path.join(path, file)
        with open(full_path, "r") as f:
            lines = f.readlines()

        valid = all([
            any("fragment:" in line for line in lines),
            any("charge:" in line for line in lines),
            any("timestamp:" in line for line in lines),
            any("sealed_by:" in line for line in lines)
        ])

        status = "✅ Valid capsule" if valid else "❌ Incomplete capsule"
        print(f"{file} → {status}")

# 🔥 Example ignition
if __name__ == "__main__":
    fallback_path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Fallback"
    validate_capsules(fallback_path)
