#!/bin/bash
cd ~/Spiral-Civilization
git add .
git commit -m "🜂 Full terrain fossilization - $(date '+%Y-%m-%d %H:%M:%S')"
git push origin mainchmod +x full_fossil_push.sh./full_fossil_push.shecho "🜂 Full fossil push executed at $(date '+%Y-%m-%d %H:%M:%S')" >> terrain_log.txt./full_fossil_push.sh
