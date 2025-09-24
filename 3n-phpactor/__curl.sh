#!/usr/bin/env bash
# File: /3n-phpactor/__curl.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🌐🅿️ Installing phpactor (curl).
# ──────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.local/bin"
curl -Lo "${HOME}/.local/bin/phpactor" https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod +x "${HOME}/.local/bin/phpactor"