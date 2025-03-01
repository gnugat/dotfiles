#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_append_exec.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🐚 Shell (environment variables, paths).
## ─────────────────────────────────────────────────────────────────────────────

##
# Appends to `script_file` the given `exec_line`.
#
# _Notes_:
# * attempts to create the file if it didn't exist
# * only appends if the `exec_line` statement wasn't already in the file
# * appends an empty line before appending the exec line
#
# ```bash
# _ssdf_append_exec "~/.config/shell/boot.local.sh" "fastfetch"
# ```
##
_ssdf_append_exec() {
    local script_file="$1"
    local exec_bin="$2"

    _ssdf_ensure_file_is_created "${script_file}"
    if ! $(grep -qE "^\s*${exec_bin}" "${script_file}"); then
        _ssdf_append_empty_line "${script_file}"
        echo "if command -v "${exec_bin}" >/dev/null 2>&1; then" >> "${script_file}"
        echo "    ${exec_bin}" >> "${script_file}"
        echo "fi" >> "${script_file}"
    fi

    unset script_file exec_bin
}
