#!/usr/bin/env bash
# File: /713-php/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🐘 Installing PHP extensions' system libraries, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

HOMEBREW_NO_ENV_HINTS=1 brew install -q \
    librdkafka # for rdkafka
