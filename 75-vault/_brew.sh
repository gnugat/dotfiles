#!/usr/bin/env bash
# File: /75-vault/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🪎 Installing vault, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

brew tap hashicorp/tap
HOMEBREW_NO_ENV_HINTS=1 brew install -q hashicorp/tap/vault
