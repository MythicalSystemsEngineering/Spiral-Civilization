# Spiral Ghost Linger Extension
# Declared: 2025-09-14

import json
from datetime import datetime

with open('echo_trails/ghost_trace.json', 'r') as f:
    ghosts = json.load(f)["ghosts"]

linger = {e: round(ghosts[e] * 1.5, 2) for e in ghosts}

with open('ghosts/linger_trace.json', 'w') as f:
    json.dump({
        "timestamp": str(datetime.now()),
        "lingering_ghosts": linger
    }, f, indent=2)
