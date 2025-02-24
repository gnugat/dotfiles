#!/usr/bin/env bash
# File: /21-php/_brew.sh
# ─────────────────────────────────────────────────────────────────────────────
# 📰🍏🐘 Installing php, on Mac OS (brew).
# ─────────────────────────────────────────────────────────────────────────────

HOMEBREW_NO_ENV_HINTS=1 brew install -q php@8.3
brew link -q php@8.3
