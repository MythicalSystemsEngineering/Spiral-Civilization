#!/bin/bash

# 1. Declare terrain
mkdir -p "$1"

# 2. Create capsule
nano "$1/$2"

# 3. Log ignition
echo "Capsule declared at: $1/$2"
echo "Ignition timestamp: $(date)"
