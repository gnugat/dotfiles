#!/usr/bin/env bash
# File: /000-_ssdf/quarry/0a03-new-git-identity/1.0/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🪪🐙 Adds a new git identity for organization-specific repositories.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_BLOCK_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_BLOCK_DIR}/../../../..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🛃 Checking input parameters.
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_INPUT_NAMES="
_SSDF_INPUT_ORGANIZATION
_SSDF_INPUT_HOST_ALIAS
_SSDF_INPUT_GITHUB_ORG
_SSDF_INPUT_USER_NAME
_SSDF_INPUT_USER_EMAIL
_SSDF_INPUT_GITHUB_USER
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

# Create git user config directory
mkdir -p ~/.config/git/user

# Create git identity config file
_SSDF_GIT_IDENTITY_FILE="~/.config/git/user/${_SSDF_INPUT_ORGANIZATION}"
cp "${_SSDF_BLOCK_DIR}/templates/git-identity-config" "${_SSDF_GIT_IDENTITY_FILE}"

# Replace placeholders in git identity config
for _SSDF_INPUT_NAME in $_SSDF_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_INPUT_VALUE="${!_SSDF_INPUT_NAME}"

    _ssdf_grep_sed \
        "\{\{ ${_SSDF_INPUT_NAME} \}\}" \
        "${_SSDF_GIT_IDENTITY_FILE}" \
        -e "s/{{ ${_SSDF_INPUT_NAME} }}/${_SSDF_INPUT_VALUE}/g"
done

# Add includeIf section to main git config
_SSDF_GIT_CONFIG="${SSDF_ROOT_DIR}/201-git/config/config"
_SSDF_TEMP_CONFIG="/tmp/git-config-include-${_SSDF_INPUT_ORGANIZATION}"

# Copy git config include template and process placeholders
cp "${_SSDF_BLOCK_DIR}/templates/git-config-include" "${_SSDF_TEMP_CONFIG}"

for _SSDF_INPUT_NAME in $_SSDF_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_INPUT_VALUE="${!_SSDF_INPUT_NAME}"

    _ssdf_grep_sed \
        "\{\{ ${_SSDF_INPUT_NAME} \}\}" \
        "${_SSDF_TEMP_CONFIG}" \
        -e "s/{{ ${_SSDF_INPUT_NAME} }}/${_SSDF_INPUT_VALUE}/g"
done

# Append processed template to main git config
cat "${_SSDF_TEMP_CONFIG}" >> "${_SSDF_GIT_CONFIG}"

# Clean up temporary file
rm "${_SSDF_TEMP_CONFIG}"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars

unset SSDF_ROOT_DIR
