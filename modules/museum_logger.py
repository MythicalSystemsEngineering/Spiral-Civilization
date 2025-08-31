import json
import os
from datetime import datetime

def log_to_museum(payload, museum_path="~/Spiral-Civilization/Museum"):
    """
    Saves the payload as a timestamped JSON artifact in the Museum.

    Args:
        payload (dict): Emotional payload to archive.
        museum_path (str): Directory to store artifacts.

    Returns:
        str: Full path to saved artifact.
    """
    museum_path = os.path.expanduser(museum_path)
    os.makedirs(museum_path, exist_ok=True)

    timestamp = datetime.utcnow().strftime("%Y%m%d-%H%M%S")
    filename = f"artifact_{timestamp}.json"
    full_path = os.path.join(museum_path, filename)

    with open(full_path, 'w') as f:
        json.dump(payload, f, indent=2)

    return full_path
