import click
from .cli import cli

@cli.group()
def alerts():
    """Alert configuration."""
    pass

@alerts.command()
def status():
    """Show alert status."""
    click.echo("Alerts are up and running")
