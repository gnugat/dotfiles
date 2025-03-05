#!/usr/bin/env bash
# File: /00-_ssdf/bin/ssdf-sed.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files scripts.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🤝 Portability.
## ─────────────────────────────────────────────────────────────────────────────

##
# For cross-platform compatible `sed`, use this script
# (this works for bash v3+, and zsh).
#
### Replace all `s/<PATTERN>/<REPLACEMENT>/g`
#
# ```bash
# ssdf-sed.sh \
#     -e "s/catpuccin/catppuccin/g" \
#     "${HOME}/.config/alacritty/alacritty.toml"
# ```
#
### Append after `/<PATTERN>/a<ADDITION>`
### Insert before `/<PATTERN>/i<ADDITION>`
#
# ```shell
# ssdf-sed.sh \
#     -e '/* first line in list/a\' \
#     -e '* second line in list' \
#     /tmp/list.txt
# ```
#
### Delete `/<PATTERN>/d`
#
# ```bash
# ssdf-sed.sh \
#     -e "/^\[general\]/d" \
#     "${HOME}/.config/alacritty/alacritty.old.toml"
# ```
#
### Extended regex `-E`
#
# ```bash
# ssdf-sed.sh \
#     -E "s/^(    SSDF_TAGS='[^']*)'/\1 ${_SSDF_INPUT_TAG_ID:0:1}'/" \
#     "${SSDF_ROOT_DIR}/install.sh"
# ```
#
### Script files `-f`
#
# ```bash
# ssdf-sed.sh \
#     -f "${_SSDF_INSTALL_SED}" \
#     "${SSDF_ROOT_DIR}/install.sh"
# ```
##

_SSDF_BIN_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
_SSDF_FUNCTION_DIR="$(realpath "${_SSDF_BIN_DIR}/../functions")"
source "${_SSDF_FUNCTION_DIR}/_ssdf_sed.sh"

_ssdf_sed "${@}"

unset _SSDF_BIN_DIR \
    _SSDF_FUNCTION_DIR
