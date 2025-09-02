from modules.memory_engine import generate_payload, apply_decay, ignite_glyphs
from datetime import datetime, timezone

payload = generate_payload(
    emotional_charge=9.2,
    traits=['curious', 'focused'],
    anchors=['legacy', 'precision'],
    meta={'source': 'test'},
    decay_mode='linear',
    sealed=True
)

payload = apply_decay(payload, datetime.now(timezone.utc))
payload = ignite_glyphs(payload)

print(payload)
