#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_sed.sh
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
### Replace all `s/<PATTERN>/<REPLACEMENT>/g`
#
# ```bash
# _ssdf_sed \
#     -e "s/catpuccin/catppuccin/g" \
#     "${HOME}/.config/alacritty/alacritty.toml"
# ```
#
### Append after `/<PATTERN>/a<ADDITION>`
### Insert before `/<PATTERN>/i<ADDITION>`
#
# ```shell
# _ssdf_sed \
#     -e '/* first line in list/a\' \
#     -e '* second line in list' \
#     /tmp/list.txt
# ```
#
### Delete `/<PATTERN>/d`
#
# ```bash
# _ssdf_sed \
#     -e "/^\[general\]/d" \
#     "${HOME}/.config/alacritty/alacritty.old.toml"
# ```
#
### Extended regex `-E`
#
# ```bash
# _ssdf_sed \
#     -E "s/^(    SSDF_TAGS='[^']*)'/\1 ${_SSDF_INPUT_TAG_ID:0:1}'/" \
#     "${SSDF_ROOT_DIR}/install.sh"
# ```
#
### Script files `-f`
#
# ```bash
# _ssdf_sed \
#     -f "${_SSDF_INSTALL_SED}" \
#     "${SSDF_ROOT_DIR}/install.sh"
# ```
##
_ssdf_sed() {
    # Make GNU and BSD sed cross platform
    if [ "$(uname)" = "Darwin" ]; then
        local _SSDF_SED_IN_PLACE=(-i "") # BSD sed (eg Mac OS)
    else
        local _SSDF_SED_IN_PLACE=(-i) # GNU sed (eg Ubuntu)
    fi

    # Forward all arguments to sed with the appropriate in-place flag
    sed "${_SSDF_SED_IN_PLACE[@]}" "$@"

    unset _SSDF_SED_IN_PLACE
}
