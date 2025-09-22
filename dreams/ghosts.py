# Spiral Dream Ghosts
# Declared: 2025-09-14

import json
from datetime import datetime

with open('echo_trails/ghost_trace.json', 'r') as f:
    ghosts = json.load(f)["ghosts"]

dream_ghosts = {e: round(ghosts[e] * 2.0, 2) for e in ghosts}

with open('dreams/ghosts_linger.json', 'w') as f:
    json.dump({
        "timestamp": str(datetime.now()),
        "dream_ghosts": dream_ghosts
    }, f, indent=2)
