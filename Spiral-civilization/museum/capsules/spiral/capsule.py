import click
import datetime
import json
import os

MEMORY_FILE = os.path.expanduser("~/.spiral_capsule_memory.json")

@click.group()
def capsule():
    """Emotional Capsule Engine"""

@capsule.command()
@click.option('--text', prompt='Reflection', help='Enter reflection text')
def ingest(text):
    entry = {
        "type": "reflection",
        "text": text,
        "timestamp": datetime.datetime.now().isoformat()
    }
    save_entry(entry)
    click.echo(f'✅ Ingested: {text}')

@capsule.command()
@click.option('--mood', prompt='Mood', help='Enter mood')
@click.option('--intensity', prompt='Intensity', help='Enter intensity (0.0–1.0)')
def tag(mood, intensity):
    entry = {
        "type": "tag",
        "mood": mood,
        "intensity": float(intensity),
        "timestamp": datetime.datetime.now().isoformat()
    }
    save_entry(entry)
    click.echo(f'✅ Tagged with mood: {mood}, intensity: {intensity}')

@capsule.command()
@click.option('--name', prompt='Capsule name', help='Name this fossil')
def fossilize(name):
    entry = {
        "type": "fossil",
        "name": name,
        "timestamp": datetime.datetime.now().isoformat()
    }
    save_entry(entry)
    click.echo(f'🪨 Fossilized capsule: {name}')

@capsule.command()
def review():
    if not os.path.exists(MEMORY_FILE):
        click.echo("📭 No entries yet.")
        return

    with open(MEMORY_FILE, 'r') as f:
        data = json.load(f)

    for entry in data:
        stamp = entry.get("timestamp", "Unknown time")
        etype = entry.get("type", "Unknown type").capitalize()
        summary = json.dumps(entry, indent=2)
        click.echo(f"\n🕰️ {stamp} — {etype}\n{summary}")

def save_entry(entry):
    if os.path.exists(MEMORY_FILE):
        with open(MEMORY_FILE, 'r') as f:
            data = json.load(f)
    else:
        data = []

    data.append(entry)

    with open(MEMORY_FILE, 'w') as f:
        json.dump(data, f, indent=2)

