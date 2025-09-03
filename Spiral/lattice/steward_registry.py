import os
import yaml

def get_active_stewards():
    # Resolve absolute path to registry file
    registry_path = os.path.join(os.path.dirname(__file__), 'steward_registry.yaml')
    print(f"🔍 Registry path: {registry_path}")

    # Check if registry file exists
    if not os.path.exists(registry_path):
        print("⚠️ Registry not found")
        return []

    # Load YAML content
    with open(registry_path, 'r') as f:
        try:
            registry = yaml.safe_load(f)
            print(f"📦 Raw registry content: {registry}")
        except yaml.YAMLError as e:
            print(f"❌ YAML load error: {e}")
            return []

    # Filter active stewards
    if not registry:
        print("⚠️ Registry is empty or malformed")
        return []

    active = [s for s in registry if s.get('status') == 'active']
    if not active:
        print("⚠️ No stewards found in registry. Pulse aborted.")
    else:
        print(f"✅ Active stewards: {[s['name'] for s in active]}")

    return active
