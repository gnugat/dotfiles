#!/usr/bin/env bash
# File: /705-vault/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🪎 Installing vault, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

brew tap hashicorp/tap
brew trust --formula hashicorp/tap/vault
HOMEBREW_NO_ENV_HINTS=1 brew install -q hashicorp/tap/vault
