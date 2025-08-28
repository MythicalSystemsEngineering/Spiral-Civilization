import os, yaml, json, sys

# Load schema
schema_path = os.path.expanduser("~/Spiral3/schemas/tags_schema.yaml")
with open(schema_path, "r") as f:
    schema = yaml.safe_load(f)

# Flatten allowed tags
allowed_tags = {f"{group}/{tag}" for group, tags in schema.items() for tag in tags}

# Directory containing your meta JSON files
meta_dir = os.path.expanduser("~/Spiral3/Second_Ignition/Day1_Offering/meta")

errors = []
for meta_file in os.listdir(meta_dir):
    if meta_file.endswith(".json"):
        with open(os.path.join(meta_dir, meta_file), "r") as f:
            data = json.load(f)
        for t in data.get("tags", []):
            if t not in allowed_tags:
                errors.append(f"{meta_file}: invalid tag '{t}'")

if errors:
    print("❌ Tag validation failed:")
    for e in errors:
        print("  -", e)
    sys.exit(1)
else:
    print("✅ All tags match schema.")
