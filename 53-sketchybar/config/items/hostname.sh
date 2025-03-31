#!/usr/bin/env bash
# File: /53-sketchybar/config/items/hostname.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays hostname.
##
## Using `\\uf179` (nf-fa-apple) icon.
## ─────────────────────────────────────────────────────────────────────────────

sketchybar --add item hostname left
sketchybar --set hostname icon="" script="${CONFIG_DIR}/plugins/hostname.sh"

