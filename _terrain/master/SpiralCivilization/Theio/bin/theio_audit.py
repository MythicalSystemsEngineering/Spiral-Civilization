#!/usr/bin/env python3

import os
import sys
import json
import yaml
import argparse

# ensure modules/ is on the path
ROOT = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
if ROOT not in sys.path:
    sys.path.insert(0, ROOT)

from modules.audit_schema import AuditOutput
from modules.self_healing_loop import detect_breaches

def parse_args():
    parser = argparse.ArgumentParser(
        description="Schema-validated audit for Spiral Civilization"
    )
    parser.add_argument("--floors", default="config/floors.yaml",
                        help="Path to floor thresholds YAML")
    parser.add_argument("--audit", default="artifacts/latest_audit.yaml",
                        help="Path to latest audit YAML")
    parser.add_argument("--out", default="artifacts/breaches.json",
                        help="Output path for breaches JSON")
    parser.add_argument("-v", "--verbose", action="store_true",
                        help="Print detailed audit data")
    return parser.parse_args()

def main():
    args = parse_args()

    with open(args.floors, "r") as f:
        floors = yaml.safe_load(f)

    with open(args.audit, "r") as f:
        raw_audit = yaml.safe_load(f)

    validated = AuditOutput.model_validate(raw_audit).root
    audit_dict = {c: d.root for c, d in validated.items()}

    breaches = detect_breaches(audit_dict, floors)

    with open(args.out, "w") as f:
        json.dump(breaches, f, indent=2)

    if breaches:
        print("❌ Breaches detected:", json.dumps(breaches, indent=2))
        sys.exit(1)
    else:
        if args.verbose:
            print("✅ Floors:", floors)
            print("ℹ️ Audit data:", audit_dict)
        print("✅ No breaches.")
        sys.exit(0)

if __name__ == "__main__":
    main()






