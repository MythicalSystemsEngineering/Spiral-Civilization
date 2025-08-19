#!/bin/bash
cd ~/Spiral-Civilization
git add .
git commit -m "Auto Fossil Push - $(date '+%Y-%m-%d %H:%M:%S')"
git push origin main
