import click
from .core import greet

@click.group()
def cli():
    """Spiral Civilization CLI."""
    pass

cli.add_command(greet)

if __name__ == "__main__":
    cli()
