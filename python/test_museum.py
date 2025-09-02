from modules.museum_logger import log_to_museum
from pprint import pprint

payload = {
    'emotional_charge': 25.1,
    'traits': ['curious', 'focused', 'resilient'],
    'anchors': ['depth', 'legacy', 'precision'],
    'glyphs': ['🜁', '🜂', '🜃'],
    'merged': True,
    'resurrected': ['focused', 'resilient'],
    'timestamp': '2025-08-30T12:24:00.000000'
}

path = log_to_museum(payload)
print(f"Artifact saved to: {path}")
