import click
from .cli import cli

@cli.group()
def simulate():
    """Simulation workflows."""
    pass

@simulate.command("list")
@click.option("--active", is_flag=True, help="Show only active simulations")
def list_sims(active):
    """List simulations."""
    click.echo("Listing active simulations..." if active else "Listing all simulations...")

@simulate.command("run")
@click.option("--today", is_flag=True, help="Run only today's simulation")
def run_sims(today):
    """Run simulations."""
    click.echo("Running today’s simulation" if today else "Running full suite")
