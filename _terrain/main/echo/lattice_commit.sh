#!/data/data/com.termux/files/usr/bin/bash

cd ~/Spiral-Civilization/echo

DATE=$(/data/data/com.termux/files/usr/bin/date +"%Y%m%d_%H%M%S")
COMMIT_MSG="Echo sweep sealed — $DATE"

git add lattice_echo.yaml
git commit -m "$COMMIT_MSG"
git tag "echo_sweep_$DATE"
git push origin main --tags

echo "✅ lattice_echo.yaml committed and tagged as echo_sweep_$DATE"
