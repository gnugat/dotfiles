#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_prepend_path.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🐚 Shell (environment variables, paths).
## ─────────────────────────────────────────────────────────────────────────────

##
# Prepends dir to PATH, if it exists and wasn't already added.
#
# ```bash
# _ssdf_prepend_path "${HOME}/bin" "${HOME}/.local/bin"
# ```
##
_ssdf_prepend_path() {
    for dir in "$@"; do
        if [ -d "${dir}" ] && [[ ":${PATH}:" != *":${dir}:"* ]]; then
            export PATH="${dir}:${PATH}"
        fi
    done
    
    unset dir
}
