from modules.memory_engine import generate_payload
from datetime import datetime

payload = generate_payload(
    emotional_charge=9,
    traits=['curious', 'focused'],
    anchors={'origin': 'Node-A'},
    meta='B',
    decay_mode='adaptive',
    sealed=True,
    timestamp=datetime.utcnow().isoformat() + 'Z'
)

print(payload)
