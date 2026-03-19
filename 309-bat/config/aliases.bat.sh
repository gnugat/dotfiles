#!/usr/bin/env bash
# File: /309-bat/config/aliases.bat.sh
# ──────────────────────────────────────────────────────────────────────────────
# 😎🦇 ALIAS management, for bat.
# ──────────────────────────────────────────────────────────────────────────────

if command -v batcat >/dev/null 2>&1; then
    alias bat='batcat'
fi
