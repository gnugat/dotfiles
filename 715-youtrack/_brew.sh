#!/usr/bin/env bash
# File: /715-youtrack/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🎫 Installing youtrack, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

brew tap jetbrains/utils

HOMEBREW_NO_ENV_HINTS=1 brew install -q jetbrains/utils/youtrack
