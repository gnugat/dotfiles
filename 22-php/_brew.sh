#!/usr/bin/env bash
# File: /22-php/_brew.sh
# ─────────────────────────────────────────────────────────────────────────────
# 📰🍏🐘 Installing php, on Mac OS (brew).
# ─────────────────────────────────────────────────────────────────────────────

HOMEBREW_NO_ENV_HINTS=1 brew install -q "php@${SSDF_PHP_VERSION}"
brew link -q "php@${SSDF_PHP_VERSION}"
