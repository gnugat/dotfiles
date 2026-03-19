#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_ensure_file_is_created.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📃 File manipulation.
## ─────────────────────────────────────────────────────────────────────────────

##
# Attempts to create `file` if it doesn't exist.
#
# ```bash
# _ssdf_ensure_file_is_created "${HOME}/.config/shell/envvars.local.sh"
# ```
##
_ssdf_ensure_file_is_created() {
    local file="$1"

    if [ ! -e "${file}" ]; then
        touch "${file}"
    fi

    unset file
}
