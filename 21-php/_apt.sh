#!/usr/bin/env bash
# File: /21-php/_apt.sh
# ─────────────────────────────────────────────────────────────────────────────
# 📰🍊🐘 Installing php, on Ubuntu (apt).
# ─────────────────────────────────────────────────────────────────────────────

echo "php${_SSDF_PHP_VERSION}"
sudo apt-get install "php${_SSDF_PHP_VERSION}" \
    "php${_SSDF_PHP_VERSION}-curl" \
    "php${_SSDF_PHP_VERSION}-intl" \
    "php${_SSDF_PHP_VERSION}-mbstring" \
    "php${_SSDF_PHP_VERSION}-zip" \
    "php${_SSDF_PHP_VERSION}-xml"
