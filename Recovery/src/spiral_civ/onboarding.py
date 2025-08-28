import click
from .cli import cli

@cli.group()
def onboarding():
    """Steward onboarding."""
    pass

@onboarding.command("test")
@click.option("--steward", required=True, help="Steward name to test")
def test_onboarding(steward):
    """Test onboarding flow."""
    click.echo(f"Running onboarding test for {steward}")
