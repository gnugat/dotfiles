#!/usr/bin/env bash
# File: /501-aerospace/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🌠 Installing aerospace, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

brew tap nikitabobko/tap
brew trust --cask nikitabobko/tap/aerospace
HOMEBREW_NO_ENV_HINTS=1 brew install -q --cask nikitabobko/tap/aerospace
