#!/usr/bin/env bash
# File: /53-sketchybar/config/items/keyboard.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays the current keyboard layout.
##
## Using `\\uf11c` (nf-fa-keyboard) icon.
## ─────────────────────────────────────────────────────────────────────────────

sketchybar --add item keyboard right
sketchybar --set keyboard icon="" update_freq=1 script="${CONFIG_DIR}/plugins/keyboard.sh"

