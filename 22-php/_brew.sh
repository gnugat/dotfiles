#!/usr/bin/env bash
# File: /22-php/_brew.sh
# ─────────────────────────────────────────────────────────────────────────────
# 📰🍏🐘 Installing php, on Mac OS (brew).
# ─────────────────────────────────────────────────────────────────────────────

HOMEBREW_NO_ENV_HINTS=1 brew install -q "php@${_SSDF_PHP_VERSION}"
brew link -q "php@${_SSDF_PHP_VERSION}"
