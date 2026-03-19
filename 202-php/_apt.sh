#!/usr/bin/env bash
# File: /202-php/_apt.sh
# ─────────────────────────────────────────────────────────────────────────────
# 📰🍊🐘 Installing php, on Ubuntu (apt).
# ─────────────────────────────────────────────────────────────────────────────

sudo apt-get install \
    "php${SSDF_PHP_VERSION}" \
    autoconf automake libtool m4 make gcc # for PIE
