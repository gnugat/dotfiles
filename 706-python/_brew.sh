#!/usr/bin/env bash
# File: /706-python/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🐍 Installing python, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

# Install Python 3.13 (latest stable, avoiding 3.14)
HOMEBREW_NO_ENV_HINTS=1 brew install -q python@3.13 pipx
