#!/usr/bin/env bash
# File: /53-sketchybar/config/plugins/datetime.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays the date and time in `YYYY-MM-DD HH:MM` format.
## ─────────────────────────────────────────────────────────────────────────────
sketchybar --set $NAME label="$(date +'%Y-%m-%d %H:%M')"
