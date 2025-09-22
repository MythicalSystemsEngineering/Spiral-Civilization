#!/bin/bash

# Parse drift report into categories
grep "<" charge_drift_report.txt > missing_in_index.txt       # Hooks in terrain but missing in index
grep ">" charge_drift_report.txt > missing_in_terrain.txt     # Hooks in index but missing in terrain
grep "|" charge_drift_report.txt > charge_mismatch.txt        # Hooks present in both but with charge mismatch

# Summary counts
echo "Missing in Index: $(wc -l < missing_in_index.txt)"
echo "Missing in Terrain: $(wc -l < missing_in_terrain.txt)"
echo "Charge Mismatches: $(wc -l < charge_mismatch.txt)"
