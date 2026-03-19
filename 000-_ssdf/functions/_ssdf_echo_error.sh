#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_echo_error.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📰 Display helpers.
## ─────────────────────────────────────────────────────────────────────────────

##
# Display error message.
#
# ```bash
# _ssdf_echo_error "Current Package Manager not part of supported ones (apt)."
# ```
##
_ssdf_echo_error() {
    local _ssdf_message="$1"

    echo " "
    echo " [ERROR] ${_ssdf_message}" >&2
    echo " "
    exit 1
    
    unset _ssdf_message
}
