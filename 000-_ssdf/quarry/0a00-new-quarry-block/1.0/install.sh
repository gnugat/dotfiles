#!/usr/bin/env bash
# File: /000-_ssdf/quarry/0a00-new-quarry-block/1.0/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🪨🧊 Creates a new Quarry (of Creation) Block.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_BLOCK_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
_SSDF_QUARRY_DIR="$(realpath "${_SSDF_BLOCK_DIR}/../..")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_QUARRY_DIR}/../..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🛃 Checking input parameters.
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_INPUT_NAMES="
_SSDF_INPUT_BLOCK_ID
_SSDF_INPUT_BLOCK_NAME
_SSDF_INPUT_BLOCK_EMOJI
_SSDF_INPUT_BLOCK_TITLE
_SSDF_INPUT_BLOCK_SHORT_DESCRIPTION
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
_SSDF_BLOCK_DESTINATION="${_SSDF_QUARRY_DIR}/${_SSDF_INPUT_BLOCK_ID}-${_SSDF_INPUT_BLOCK_NAME}"
cp -ri \
    "${_SSDF_BLOCK_DIR}/templates" \
    "${_SSDF_BLOCK_DESTINATION}"

# Replace placeholders in copied templates
for _SSDF_INPUT_NAME in $_SSDF_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_INPUT_VALUE="${!_SSDF_INPUT_NAME}"

    _ssdf_grep_sed \
        "\{\{ ${_SSDF_INPUT_NAME} \}\}" \
        "${_SSDF_BLOCK_DESTINATION}" \
        -e "s/{{ ${_SSDF_INPUT_NAME} }}/${_SSDF_INPUT_VALUE}/g"
done

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars

unset SSDF_ROOT_DIR
