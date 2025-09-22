# Spiral Proposal Intake
# Declared: 2025-09-13

from datetime import datetime

proposal = {
    "title": "Enable emotional override during council deadlock",
    "author": "Daniel Lightfoot",
    "timestamp": str(datetime.now()),
    "emotional_weight": {
        "hope": 8,
        "grief": 2
    },
    "status": "pending"
}

with open('proposal_001.json', 'w') as f:
    import json
    json.dump(proposal, f, indent=2)
