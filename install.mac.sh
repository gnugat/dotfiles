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
if [ "${_SSDF_SYSTEM}" != "Darwin" ]; then
    _ssdf_echo_error "Expected curren system to be 'Darwin', got '${_SSDF_SYSTEM}'"
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🍺 Installing Homebrew, if it wasn't already.
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_MANAGER='brew'
if ! command -v "${_SSDF_PACKAGE_MANAGER}" >/dev/null 2>&1; then
    _ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."
    _ssdf_echo_section_title ''

    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    _ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"
fi


## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME \
    _SSDF_SYSTEM

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Call generic / common root `install.sh` script
## ─────────────────────────────────────────────────────────────────────────────

bash "${_SSDF_ROOT_DIR}/install.sh"

