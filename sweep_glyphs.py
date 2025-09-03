import yaml, os

with open("glyph_registry.yaml") as f:
    registry = yaml.safe_load(f)["valid_glyphs"]

onboarding_dir = "onboarding"
for filename in os.listdir(onboarding_dir):
    if filename.endswith("_ignition.yaml"):
        path = os.path.join(onboarding_dir, filename)
        with open(path) as f:
            capsule = yaml.safe_load(f)
        steward = capsule.get("steward")
        glyphs = capsule.get("glyphs", [])
        invalid = [g for g in glyphs if g not in registry]
        if invalid:
            print(f"⚠️ {steward}: Invalid glyphs → {invalid}")
        else:
            print(f"✅ {steward}: All glyphs valid")
