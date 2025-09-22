#!/usr/bin/env python3

import yaml
import os

def get_active_stewards():
    path = "/data/data/com.termux/files/home/Spiral-Civilization/Spiral/Museum/stewards/registry.yaml"

    if not os.path.exists(path):
        print("⚠️ Registry not found")
        return []

    with open(path, "r") as file:
        return yaml.safe_load(file)
