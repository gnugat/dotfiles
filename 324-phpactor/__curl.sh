#!/usr/bin/env bash
# File: /324-phpactor/__curl.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🌐🅿️ Installing phpactor (curl).
# ──────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.local/bin"
curl -Lo "${HOME}/.local/bin/phpactor" https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod +x "${HOME}/.local/bin/phpactor"