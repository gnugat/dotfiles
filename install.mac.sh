#!/usr/bin/env bash
# File: /install.mac.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔵🍏🍺 Super Secret Dot Files (SSDF). Installation script for Mac OS (brew).
#
# ℹ️  **Requirements**:
# - 💲 bash (for running scripts)
# - 🌐 curl (for downloading homebrew)
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

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

_SSDF_PACKAGE_MANAGER='brew'
if ! command -v "${_SSDF_PACKAGE_MANAGER}" >/dev/null 2>&1; then
    _ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."
    _ssdf_echo_section_title ''

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    echo "Adding /opt/homebrew/bin to PATH"
    export PATH="/opt/homebrew/bin:${PATH}"

    _ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"
fi

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Call generic / common root `install.sh` script
##
## Setting tags to:
## * 0: 🏭 internal SSDF functions
## * 1: 🫗 bare minimum (ideal for ssh servers, or Docker Containers)
## * 2: 🧱 base (common set up)
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_TAGS='0 1 2'
bash "${_SSDF_ROOT_DIR}/install.sh"

