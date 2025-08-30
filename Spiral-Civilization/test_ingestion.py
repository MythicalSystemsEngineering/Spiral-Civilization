from modules.memory_engine import generate_payload, apply_decay
from datetime import datetime, timezone

payload = generate_payload(
    emotional_charge=9,
    traits=['curious', 'focused'],
    anchors={'origin': 'Node-A'},
    meta='B',
    decay_mode='adaptive',
    sealed=True,
    timestamp=datetime.now(timezone.utc).isoformat()
)

payload = apply_decay(payload, datetime.now(timezone.utc))

print(payload)
