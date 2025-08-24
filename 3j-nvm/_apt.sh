#!/usr/bin/env bash
# File: /3j-nvm/_apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍊🚦 Installing nvm, on Ubuntu (apt).
# Actually, there's no apt package for it, so doing it manually with curl.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"

source "${_SSDF_PACKAGE_DIR}/__curl.sh"
