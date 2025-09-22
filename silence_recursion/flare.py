# Spiral Silence Override Flare
# Declared: 2025-09-14

from datetime import datetime
import os

last_override = os.path.getmtime('override_scars/scar_001.json')
now = datetime.now().timestamp()

if now - last_override > 86400:  # 24 hours of silence
    with open('silence_recursion/flare.log', 'a') as log:
        log.write(f"\n🜁 Silence override triggered — {datetime.now()}")
