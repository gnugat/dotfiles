#!/usr/bin/env bash
# File: /10-shell/config/envvars.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️  ENVVAR management.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏺 Sets history size to "large".
## ─────────────────────────────────────────────────────────────────────────────
export HISTSIZE=100000
export HISTFILESIZE="${HISTSIZE}"

### ────────────────────────────────────────────────────────────────────────────
### 🏺🙉 Ignores "mundane" commands.
### ────────────────────────────────────────────────────────────────────────────
export HISTIGNORE="ls:cd:bf:bg:exit"

### ────────────────────────────────────────────────────────────────────────────
### 🏺🙈 Ignores:
### - lines starting with a space (to allow privacy)
### - duplicates
### ────────────────────────────────────────────────────────────────────────────
export HISTCONTROL="ignoreboth"

## ─────────────────────────────────────────────────────────────────────────────
## 💻 Sets sensible program defaults.
## ─────────────────────────────────────────────────────────────────────────────
export PAGER=$(which less)
export EDITOR=$(which vim)

