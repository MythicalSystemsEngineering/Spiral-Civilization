cat > scripts/seal_museum.py << 'EOF'
#!/usr/bin/env python3
import json, argparse
from datetime import datetime

parser = argparse.ArgumentParser()
parser.add_argument("--file", required=True)
parser.add_argument("--glyph", required=True)
args = parser.parse_args()

with open(args.file, "r") as f:
    data = json.load(f)

data["seal"] = {
    "glyph": args.glyph,
    "sealed_at": datetime.utcnow().isoformat() + "Z"
}

with open(args.file, "w") as f:
    json.dump(data, f, indent=2)

print(f"Sealed {args.file} with {args.glyph}")
EOF
