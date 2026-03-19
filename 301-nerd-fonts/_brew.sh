#!/usr/bin/env bash
# File: /301-nerd-fonts/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏🤓 Installing nerd-fonts, on Mac OS (brew).
# Actually, there's no brew package for it, so doing it manually with curl.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"

source "${_SSDF_PACKAGE_DIR}/__curl.sh"
