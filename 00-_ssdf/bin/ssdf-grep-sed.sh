#!/usr/bin/env bash
# File: /00-_ssdf/bin/ssdf-grep-sed.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🤝 Portability.
## ─────────────────────────────────────────────────────────────────────────────

##
# For cross-platform compatible `sed`, use this function
# (this works for bash v3+, and zsh).
#
# Arguments:
# 1. grep's PATTERN
# 2. grep's PATH
# *. everything else is sent to sed as arguments (-e SCRIPT, etc)
#
# > ℹ️ _Note_: Will sneakily use ripggrep if available, instead of grep.
#
## Replace all in path
#
# ```bash
# ssdf-grep-sed.sh \
#     "3c-fzf" \
#     "${SSDF_ROOT_DIR}" \
#     -e "s/3c-fzf/3d-fzf/g"
# ```
##

_SSDF_BIN_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
_SSDF_FUNCTION_DIR="$(realpath "${_SSDF_BIN_DIR}/../functions")"
source "${_SSDF_FUNCTION_DIR}/_ssdf_grep_sed.sh"

_ssdf_grep_sed "${@}"

unset _SSDF_BIN_DIR \
    _SSDF_FUNCTION_DIR
