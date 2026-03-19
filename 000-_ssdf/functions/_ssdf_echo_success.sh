#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_echo_success.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📰 Display helpers.
## ─────────────────────────────────────────────────────────────────────────────

##
# Display success message.
#
# ```bash
# _ssdf_echo_success "${PACKAGE_NAME} installed"
# ```
##
_ssdf_echo_success() {
    local _ssdf_message="$1"

    echo " "
    echo " [OK] ${_ssdf_message}"
    echo " "

    unset _ssdf_message
}
