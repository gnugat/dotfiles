#!/usr/bin/env bash
# File: /53-sketchybar/config/items/battery.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays the battery charge, updated every:
## * 10 minutes
## * when the computer comes back from sleep
## * when the battery charge signals a change
## ─────────────────────────────────────────────────────────────────────────────

sketchybar --add item battery right
sketchybar --set battery update_freq=600 script="${CONFIG_DIR}/plugins/battery.sh"
sketchybar --subscribe battery system_woke power_source_change

