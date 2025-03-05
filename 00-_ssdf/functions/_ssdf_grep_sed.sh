#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_grep_sed.sh
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
# _ssdf_grep_sed \
#     "3c-fzf" \
#     "${SSDF_ROOT_DIR}" \
#     -e "s/3c-fzf/3d-fzf/g"
# ```
##
_ssdf_grep_sed() {
    # Make GNU and BSD sed cross platform
    if [ "$(uname)" = "Darwin" ]; then
        local _SSDF_SED_IN_PLACE=(-i "") # BSD sed (eg Mac OS)
    else
        local _SSDF_SED_IN_PLACE=(-i) # GNU sed (eg Ubuntu)
    fi

    # Extract grep arguments, only leaving sed arguments afterwards
    local _SSDF_GREP_PATTERN="$1"
    shift
    local _SSDF_GREP_PATH="$1"
    shift

    if command -v rg >/dev/null 2>&1; then
        # Use ripgrep if available (so much faster)
        local _SSDF_MATCHED_FILES=$(rg --files-with-matches "${_SSDF_GREP_PATTERN}" "${_SSDF_GREP_PATH}")
    else
        # Otherwise fallback to good old (but very slow) grep
        local _SSDF_MATCHED_FILES=$(grep -r -l "${_SSDF_GREP_PATTERN}" "${_SSDF_GREP_PATH}")
    fi
    
    # If there are some matchings, then forward matched paths to sed, using xargs
    if [ ! -z "${_SSDF_MATCHED_FILES}" ]; then 
        # Forward all arguments to sed with the appropriate in-place flag
        echo "${_SSDF_MATCHED_FILES}" \
            | xargs sed "${_SSDF_SED_IN_PLACE[@]}" "$@"
    fi

    unset _SSDF_SED_IN_PLACE \
        _SSDF_GREP_PATTERN \
        _SSDF_GREP_PATH \
        _SSDF_MATCHED_FILES
}
