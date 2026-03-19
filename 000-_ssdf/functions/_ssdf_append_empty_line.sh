#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_append_empty_line.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📃 File manipulation.
## ─────────────────────────────────────────────────────────────────────────────

##
# Appends an empty line to `file` if:
# - it isn't empty
# - its last line isn't empty
#
# ```bash
# _ssdf_append_empty_line "${HOME}/.config/shell/envvars.local.sh"
# ```
##
_ssdf_append_empty_line() {
    local file="$1"

    if [ -s "${file}" ] && [ "$(tail -n 1 "${file}")" != "" ]; then
        echo '' >> "${file}"
    fi

    unset file
}
