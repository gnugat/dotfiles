#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_unset_envvars.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🗑️ Garbage Collectooooooooooooor~ 🎶🤘.
## ─────────────────────────────────────────────────────────────────────────────

##
# Unsets ALL "private" `_SSDF_*` environment variables.
#
# All? No! One small set of indomitable ENVVARS still holds out against the
# Garbage Collector!
#
# The "public" `SSDF_*` (note the lack of leading `_`) sill be kept, such as:
#
# * SSDF_PACKAGE_MANAGER
# * SSDF_PHP_VERSION
# * SSDF_ROOT_DIR
# * SSDF_TAGS
#
# These are "input" values valid for all scripts.
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
    # Set Internal Field Separator to `set`'s (new line).
    local old_IFS="${IFS}"
    IFS=$'\n'

    for line in $(set); do
        # If line is an ENVVAR which name starts with `_SSDF_*`
        if [[ "$line" =~ ^_SSDF_[^=]*= ]]; then
            # Extract ENVVAR name, discard remains (`=` and value)
            # Using LC_ALL=C, for cut to process input as a stream of bytes,
            # without paying attention to encoding (to allow UTF-8 support)
            local private_ssdf_variable_name=$(echo "${line}" | L_ALL=C cut -d= -f1)

            unset "${private_ssdf_variable_name}"
        fi
    done

    # Restore original IFS
    IFS="$old_IFS"
    
    unset old_IFS \
        private_ssdf_variables \
        private_ssdf_variable \
        private_ssdf_variable_name
}
