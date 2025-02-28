#!/usr/bin/env bash
# File: /install.mac.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔵🍏🍺 Super Secret Dot Files (SSDF). Installation script for Mac OS (brew).
#
# ℹ️  **Requirements**:
# - 💲 bash (for running scripts)
# - 🌐 curl (for downloading homebrew)
# ──────────────────────────────────────────────────────────────────────────────

SSDF_ROOT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="homebrew"

## ─────────────────────────────────────────────────────────────────────────────
## 🍏 Checking if system is Mac OS X (Darwin).
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_SYSTEM=$(uname)
if [ "${_SSDF_SYSTEM}" != 'Darwin' ]; then
    _ssdf_echo_error "Expected OS to be 'Darwin', got '${_SSDF_SYSTEM}'"
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🍺 Installing Homebrew, if it wasn't already.
## ─────────────────────────────────────────────────────────────────────────────

SSDF_PACKAGE_MANAGER='brew'
if ! command -v "${SSDF_PACKAGE_MANAGER}" >/dev/null 2>&1; then
    _ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."
    echo ''

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Adding /opt/homebrew/bin to PATH"
    export PATH="/opt/homebrew/bin:${PATH}"

    _ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🏷️ Selects the Mac OS specific tags, by setting `SSDF_TAGS`.
## _Note_: The tags can be manually selected as follow:
##
## ```
## SSDF_TAGS='0 1' bash install.mac.sh
## ```
##
## Package folders follow this naming convention: `<xy>-<package-name>`.
## The `<xy>` prefix digit indicates the package's:
## * `x`: tag (category)
##     * `0`: 🏭 Internal SSDF functions
##     * `1`: 🧸 Bare minimum (ideal for ssh servers, or Docker Containers)
##     * `2`: 🧱 Base minimal (common set up)
##     * `3`: 💥 Bang (productivity, common)
## * `y`: execution priority (in numeric-alphabetical order)
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_echo_section_title 'Selecting Tags'

if [ -z "${SSDF_TAGS}" ]; then
    SSDF_TAGS='0 1 2 3'
fi

_ssdf_echo_success "Tags ${SSDF_TAGS} selected"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Call generic / common root `install.sh` script
## ─────────────────────────────────────────────────────────────────────────────

bash "${SSDF_ROOT_DIR}/install.sh"

