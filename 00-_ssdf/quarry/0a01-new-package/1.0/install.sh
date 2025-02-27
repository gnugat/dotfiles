#!/usr/bin/env bash
# File: /00-_ssdf/quarry/0a01-new-package/1.0/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🪨🎁 Adds support for a new package.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_BLOCK_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_BLOCK_DIR}/../../../../")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🛃 Checking input parameters.
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_INPUT_NAMES="
_SSDF_INPUT_PACKAGE_ID
_SSDF_INPUT_PACKAGE_NAME
_SSDF_INPUT_PACKAGE_EMOJI
_SSDF_INPUT_PACKAGE_TITLE
_SSDF_INPUT_PACKAGE_SHORT_DESCRIPTION
"

for _SSDF_INPUT_NAME in $_SSDF_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_INPUT_VALUE="${!_SSDF_INPUT_NAME}"

    if [ -z "${_SSDF_INPUT_VALUE}" ]; then
        _ssdf_echo_error "Missing ${_SSDF_INPUT_NAME} input parameter"

        exit 1
    fi
done

## ─────────────────────────────────────────────────────────────────────────────
## 👢 Bootstraping.
## ─────────────────────────────────────────────────────────────────────────────

# Copy templates to destination
_SSDF_BLOCK_DESTINATION="${SSDF_ROOT_DIR}/${_SSDF_INPUT_PACKAGE_ID}-${_SSDF_INPUT_PACKAGE_NAME}"
cp -ri \
    "${_SSDF_BLOCK_DIR}/templates" \
    "${_SSDF_BLOCK_DESTINATION}"

# Make GNU and BSD sed cross platform
if [ "$(uname)" = "Darwin" ]; then
    _SSDF_SED_IN_PLACE=(-i "") # BSD sed (eg Mac OS)
else
    _SSDF_SED_IN_PLACE=(-i) # GNU sed (eg Ubuntu)
fi

# Replace placeholders in copied templates
for _SSDF_INPUT_NAME in $_SSDF_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_INPUT_VALUE="${!_SSDF_INPUT_NAME}"

    grep -r -l "{{ ${_SSDF_INPUT_NAME} }}" "${_SSDF_BLOCK_DESTINATION}" \
        | xargs sed "${_SSDF_SED_IN_PLACE[@]}" -e "s/{{ ${_SSDF_INPUT_NAME} }}/${_SSDF_INPUT_VALUE}/g"
done

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars

unset SSDF_ROOT_DIR
