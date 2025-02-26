#!/usr/bin/env bash
# File: /22-php/_apt.sh
# ─────────────────────────────────────────────────────────────────────────────
# 📰🍊🐘 Installing php, on Ubuntu (apt).
# ─────────────────────────────────────────────────────────────────────────────

sudo apt-get install "php${SSDF_PHP_VERSION}" \
    "php${SSDF_PHP_VERSION}-curl" \
    "php${SSDF_PHP_VERSION}-intl" \
    "php${SSDF_PHP_VERSION}-mbstring" \
    "php${SSDF_PHP_VERSION}-zip" \
    "php${SSDF_PHP_VERSION}-xml"
