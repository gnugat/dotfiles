#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_unset_envvars.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🗑️ Garbage Collectooooooooooooor~ 🎶🤘.
## ─────────────────────────────────────────────────────────────────────────────

##
# Unsets ALL `_SSDF_*` environment variables.
#
# All? No! One small set of indomitable ENVVARS still holds out against the
# Garbage Collector:
#
# * _SSDF_PACKAGE_MANAGER
# * _SSDF_PHP_VERSION
# * _SSDF_ROOT_DIR
# * _SSDF_TAGS
#
# These are kept as they usually are "input" values valid for all scripts.
#
# Since SSDF scripts tend to source other SSDF scripts,
# to avoid accidental reuse or unexpected values, it's best to:
#
# * use unique environment variable names per script
# * unset them at the end
# 
# This function helps with the second point.
#
# ```bash
# _ssdf_unset_envvars
# ```
##
_ssdf_unset_envvars() {
    local ssdf_variables_to_keep="_SSDF_PACKAGE_MANAGER
        _SSDF_PHP_VERSION
        _SSDF_ROOT_DIR
        _SSDF_TAGS
    "

    # Lists all variables names that start with _SSDF
    # * while read -r: makes sure each line is processed separately
    # * using temporary file due to bash 3 having issues with multiline strings
    # * set: lists all envvars in `<NAME>=<VALUE>` format, even not exported ones
    # * grep --color=never: make sure we don't get weird color characters
    # * cut: take only the name of the envvar
    while read -r ssdf_variable; do
        printf '%s\n' "${ssdf_variables_to_keep}" > /tmp/ssdf_keep_list.txt
        if ! grep -q "^${ssdf_variable}$" /tmp/ssdf_keep_list.txt; then
            unset "${ssdf_variable}"
        fi
    done <<< "$(set | grep --color=never '^_SSDF_' | cut -d= -f1)"
    
    unset ssdf_variables_to_keep ssdf_variable
}
