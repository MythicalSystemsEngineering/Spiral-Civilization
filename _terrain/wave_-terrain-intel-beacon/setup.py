from setuptools import setup, find_packages

setup(
    name="spiral-civilization",
    version="0.1.0",
    description="Spiral Civilization CLI and core",
    packages=find_packages(where="src"),
    package_dir={"": "src"},
    entry_points={
        "console_scripts": [
            "spiral=spiral_civ.cli:cli",
        ],
    },
)
