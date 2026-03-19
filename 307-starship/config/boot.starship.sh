#!/usr/bin/env bash
# File: /307-starship/config/boot.starship.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👢🚀 BOOT management, for starship.
# ──────────────────────────────────────────────────────────────────────────────

if ps -p $$ | grep -q "bash" && [ -f "${HOME}/.config/bash/shopt.sh" ]; then
    eval "$(starship init bash)"
elif ps -p $$ | grep -q "zsh" && [ "${HOME}/.config/zsh/setopt.sh" ]; then
    eval "$(starship init zsh)"
fi
export STARSHIP_CONFIG="${HOME}/.config/starship/starship.toml"
