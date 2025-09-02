from modules.decay_engine import apply_decay
from modules.trait_tracker import update_lifespans
from datetime import datetime, timedelta
from pprint import pprint

# Simulate last seen timestamps
last_seen = {
    'curious': datetime.utcnow() - timedelta(days=2),
    'focused': datetime.utcnow() - timedelta(days=10),
    'resilient': datetime.utcnow() - timedelta(days=15),
}

# Current payload
payload = {
    'emotional_charge': 22.2,
    'traits': ['curious', 'focused', 'resilient'],
    'anchors': ['depth', 'legacy', 'precision'],
    'glyphs': ['🜁', '🜂', '🜃'],
    'merged': True,
    'timestamp': '2025-08-30T11:11:05.516248'
}

# Initialize lifespans
lifespans = update_lifespans(payload['traits'], {})

# Apply decay and update lifespans
updated_payload, updated_lifespans = apply_decay(payload, last_seen, lifespans)

print("Updated Payload:")
pprint(updated_payload)
print("\nUpdated Lifespans:")
pprint(updated_lifespans)
