#!/usr/bin/env bash
# File: /319-nvm/__curl.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🌐🚦 Installing nvm (curl).
# ──────────────────────────────────────────────────────────────────────────────

PROFILE=/dev/null \
    bash -c 'curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash'
