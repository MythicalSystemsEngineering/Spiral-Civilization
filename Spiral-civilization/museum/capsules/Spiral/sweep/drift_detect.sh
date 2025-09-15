#!/bin/bash
ROOT="/data/data/com.termux/files/home/Spiral-Civilization/Spiral"
LOG="$ROOT/Museum/drift_log.txt"

echo "🔍 Drift Sweep Initiated at $(date)" > $LOG

# Sweep for ghost files (empty, orphaned, or temp)
find $ROOT -type f -name "*.tmp" >> $LOG
find $ROOT -type f -empty >> $LOG

# Sweep for unfinished arcs (files with TODO or FIXME)
grep -rE "TODO|FIXME" $ROOT --exclude=$(basename $LOG) >> $LOG

# Sweep for emotional ruptures (unsealed capsules)
find $ROOT/Museum -type f ! -name "*.capsule" >> $LOG

echo "✅ Drift Sweep Complete at $(date)" >> $LOG
