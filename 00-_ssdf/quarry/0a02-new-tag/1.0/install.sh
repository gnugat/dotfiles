#!/usr/bin/env bash
# File: /00-_ssdf/quarry/0a02-new-tag/1.0/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🪨🏷️ Adds support for a new tag.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_BLOCK_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_BLOCK_DIR}/../../../..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🛃 Checking input parameters.
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_INPUT_NAMES="
_SSDF_INPUT_TAG_ID
_SSDF_INPUT_TAG_NAME
_SSDF_INPUT_TAG_EMOJI
_SSDF_INPUT_TAG_TITLE
_SSDF_INPUT_TAG_SHORT_DESCRIPTION
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

## Copy templates to destination
_SSDF_BLOCK_DESTINATION="${SSDF_ROOT_DIR}/${_SSDF_INPUT_TAG_ID}-_${_SSDF_INPUT_TAG_NAME}"
cp -ri \
    "${_SSDF_BLOCK_DIR}/templates" \
    "${_SSDF_BLOCK_DESTINATION}"

## Replace placeholders in copied templates
for _SSDF_INPUT_NAME in $_SSDF_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_INPUT_VALUE="${!_SSDF_INPUT_NAME}"

    _ssdf_grep_sed \
        "\{\{ ${_SSDF_INPUT_NAME} \}\}" \
        "${_SSDF_BLOCK_DESTINATION}" \
        -e "s/{{ ${_SSDF_INPUT_NAME} }}/${_SSDF_INPUT_VALUE}/g"
done

## Insert tag in documentation and scripts.
### To `/README.md`, before "priority" line in:
### ```
### The `<xy>` prefix digit indicates the package's:
###
### * `x`: tag
###     * `0`: 🏭 Internal SSDF functions
###     <...>
### * `y`: priority
### ```
###
### To `/install.sh` and `/install.mac.sh`, before "priority" line in:
### ```
### ## * `x`: tag (category)
### ##     * `0`: 🏭 Internal SSDF functions
### ##     <...>
### ## * `y`: execution priority (in numeric-alphabetical order)
### ```
###
### To `/install.sh` and `/install.mac.sh`, in `SSDF_TAGS='<tags>'`

### List item to add, for example: `3`: 💥 Bang (productivity, common)
_SSDF_TAG_ITEM="\`${_SSDF_INPUT_TAG_ID:0:1}\`: ${_SSDF_INPUT_TAG_EMOJI} ${_SSDF_INPUT_TAG_TITLE}"

### Add new tag to lists in `/README.md`, `/install.sh` and `/install.mac.sh`
_ssdf_sed \
    -e "/\* \`y\`: priority/i\\" \
    -e "    * ${_SSDF_TAG_ITEM}" \
    "${SSDF_ROOT_DIR}/README.md"
_ssdf_sed \
    -e "/## \* \`y\`: execution priority/i\\" \
    -e "##     * ${_SSDF_TAG_ITEM}" \
    "${SSDF_ROOT_DIR}/install.sh"
_ssdf_sed \
    -e "/## \* \`y\`: execution priority/i\\" \
    -e "##     * ${_SSDF_TAG_ITEM}" \
    "${SSDF_ROOT_DIR}/install.mac.sh"

### Add new tag to `/install.sh` and `/install.mac.sh`, in `SSDF_TAGS='<tags>'`
_ssdf_sed \
    -E "s/^(    SSDF_TAGS='[^']*)'/\1 ${_SSDF_INPUT_TAG_ID:0:1}'/" \
    "${SSDF_ROOT_DIR}/install.sh"
_ssdf_sed \
    -E "s/^(    SSDF_TAGS='[^']*)'/\1 ${_SSDF_INPUT_TAG_ID:0:1}'/" \
    "${SSDF_ROOT_DIR}/install.mac.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars

unset SSDF_ROOT_DIR
