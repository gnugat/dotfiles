#!/usr/bin/env bash
# File: /36-zsh/config/envvars.zsh.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️ % ENVVAR management, for zsh.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏺 Sets history.
## ─────────────────────────────────────────────────────────────────────────────
export HISTFILE="${HOME}/.zsh_history"
export SAVEHIST="${HISTSIZE}"
export HISTDUP="erase" # Erases duplicates from history
