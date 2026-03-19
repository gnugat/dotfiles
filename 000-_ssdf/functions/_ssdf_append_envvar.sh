#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_append_envvar.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🐚 Shell (environment variables, paths).
## ─────────────────────────────────────────────────────────────────────────────

##
# Appends to `env_file` the `env_variable` with `env_value`.
#
# _Notes_:
# * attempts to create the file if it didn't exist
# * only appends if the `export` statement wasn't already in the file
#
# ```bash
# _ssdf_append_envvar "${_SSDF_SHELL_ENVVARS}" "ACKRC" "${HOME}/.config/ack/ackrc"
# ```
##
_ssdf_append_envvar() {
    local env_file="$1"
    local env_variable="$2"
    local env_value="$3"

    _ssdf_ensure_file_is_created "${env_file}"
    if ! $(grep -q "^export ${env_variable}=" "${env_file}"); then
        echo "export ${env_variable}=\"${env_value}\"" >> "${env_file}"
    fi

    unset env_file env_variable env_value
}
