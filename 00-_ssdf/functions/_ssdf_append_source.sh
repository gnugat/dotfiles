#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_append_source.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🐚 Shell (environment variables, paths).
## ─────────────────────────────────────────────────────────────────────────────

##
# Appends to `script_file` the given `source_line`.
#
# _Notes_:
# * attempts to create the file if it didn't exist
# * only appends if the `source_line` statement wasn't already in the file
# * appends an empty line before appending the source line
#
# ```bash
# _ssdf_append_source "~/.config/shell/aliases.local.sh" "source ${HOME}/.config/less/envvars.less.sh"
# ```
##
_ssdf_append_source() {
    local script_file="$1"
    local source_line="$2"
    _ssdf_ensure_file_is_created "${script_file}"
    if ! $(grep -qxF "${source_line}" "${script_file}"); then
        _ssdf_append_empty_line "${script_file}"
        echo "${source_line}" >> "${script_file}"
    fi
}
