#!/usr/bin/env bash
# File: /502-skhd/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏💀 Installing skhd, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

brew tap asmvik/formulae
brew trust --formula asmvik/formulae/skhd
HOMEBREW_NO_ENV_HINTS=1 brew install -q asmvik/formulae/skhd
