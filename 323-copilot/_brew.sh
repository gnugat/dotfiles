#!/usr/bin/env bash
# File: /323-copilot/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏👨‍✈️ Installing copilot, on Mac OS (brew).
# Actually, there's no apt package for it, so doing it manually with npm.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"

source "${_SSDF_PACKAGE_DIR}/__npm.sh"
