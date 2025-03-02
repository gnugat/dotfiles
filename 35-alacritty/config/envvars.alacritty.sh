#!/usr/bin/env bash
# File: /35-alacritty/config/envvars.alacritty.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️ 🔺 ENVVAR management, for alacritty.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Terminal information.
## ─────────────────────────────────────────────────────────────────────────────
export TERM_PROGRAM='Alacritty'
export TERM_PROGRAM_VERSION=$(alacritty --version)
