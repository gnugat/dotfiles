#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_echo_section_title.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📰 Display helpers.
## ─────────────────────────────────────────────────────────────────────────────

##
# Display section title.
#
# ```bash
# _ssdf_echo_section_title "Installing ${PACKAGE_NAME}"
# ```
##
_ssdf_echo_section_title() {
    local _ssdf_message="$1"

    echo "// ${_ssdf_message}"
    echo " "

    unset _ssdf_message
}
