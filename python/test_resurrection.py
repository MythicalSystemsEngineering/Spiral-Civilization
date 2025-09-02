from modules.resurrection_engine import resurrect_traits
from pprint import pprint
from datetime import datetime, timedelta

# Simulate lifespans with decayed traits
lifespans = {
    'curious': {'born': datetime.utcnow(), 'reinforced': [datetime.utcnow()], 'decayed': None},
    'focused': {'born': datetime.utcnow() - timedelta(days=10), 'reinforced': [datetime.utcnow()], 'decayed': datetime.utcnow() - timedelta(days=2)},
    'resilient': {'born': datetime.utcnow() - timedelta(days=15), 'reinforced': [datetime.utcnow()], 'decayed': datetime.utcnow() - timedelta(days=5)},
}

# Payload where 'focused' and 'resilient' reappear
payload = {
    'traits': ['curious', 'focused', 'resilient'],
    'anchors': ['depth', 'legacy'],
    'glyphs': ['🜁', '🜂'],
    'emotional_charge': 25.1,
    'merged': True,
    'timestamp': '2025-08-30T12:24:00.000000'
}

updated_payload, updated_lifespans = resurrect_traits(payload, lifespans)

print("Updated Payload:")
pprint(updated_payload)
print("\nUpdated Lifespans:")
pprint(updated_lifespans)
