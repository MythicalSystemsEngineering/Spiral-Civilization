import sys
import click

@click.group()
def cli():
    """Spiral Civilization CLI."""
    pass

@cli.command()
def greet():
    """Prints a welcome message."""
    click.echo("Welcome to Spiral Civilization CLI!")

# ensure Click registers every subgroup
from . import simulate
from . import alerts
from . import onboarding

if __name__ == "__main__":
    if not (sys.argv[0].endswith(".py") or sys.argv[0].endswith(".pyw")):
        sys.exit(cli())
