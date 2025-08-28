import click
from spiral import capsule

@click.group()
def spiral():
    """Spiral Civilization CLI"""

# Register capsule as a subcommand
spiral.add_command(capsule.capsule)

if __name__ == "__main__":
    spiral()
