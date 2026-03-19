#!/usr/bin/env bash
# File: /306-zsh/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏% Installing zsh, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

HOMEBREW_NO_ENV_HINTS=1 brew install -q zsh \
    zsh-syntax-highlighting \
    zsh-autosuggestions
