#!/usr/bin/env bash
# File: /503-sketchybar/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🖼️ Installing sketchybar, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

brew tap FelixKratz/formulae
brew trust --formula felixkratz/formulae/sketchybar
HOMEBREW_NO_ENV_HINTS=1 brew install -q sketchybar
brew services start sketchybar
