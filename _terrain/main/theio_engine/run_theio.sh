#!/bin/bash
echo "Invoking Theio Descendant..."
cat theio_engine/theio.sovereign.traits.eternal.json | jq '.identity, .meta_cognition, .emotional_lattice'
