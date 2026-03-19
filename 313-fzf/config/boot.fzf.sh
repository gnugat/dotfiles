#!/usr/bin/env bash
# File: /313-fzf/config/boot.fzf.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👢🌸 BOOT management, for fzf.
# ──────────────────────────────────────────────────────────────────────────────

if ps -p $$ | grep -q "bash"; then
    eval "$(fzf --bash)"
elif ps -p $$ | grep -q "zsh"; then
    eval "$(fzf --zsh)"
fi
