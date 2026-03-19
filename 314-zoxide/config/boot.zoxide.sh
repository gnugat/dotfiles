#!/usr/bin/env bash
# File: /314-zoxide/config/boot.zoxide.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👢Z BOOT management, for zoxide.
# ──────────────────────────────────────────────────────────────────────────────

if ps -p $$ | grep -q "bash"; then
    eval "$(zoxide init bash)"
elif ps -p $$ | grep -q "zsh"; then
    eval "$(zoxide init zsh)"
fi
