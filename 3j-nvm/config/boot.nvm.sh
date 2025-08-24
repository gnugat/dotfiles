#!/usr/bin/env bash
# File: /3j-nvm/config/boot.nvm.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👢🚦 BOOT management, for nvm.
# ──────────────────────────────────────────────────────────────────────────────

export NVM_DIR="${HOME}/.config/nvm"
[ -s "${NVM_DIR}/nvm.sh" ] && \. "${NVM_DIR}/nvm.sh"  # This loads nvm
