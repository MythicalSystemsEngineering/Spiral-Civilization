import click
from modules.governance import governance

@click.group()
def cli():
    pass

cli.add_command(governance)

if __name__ == "__main__":
    cli()
