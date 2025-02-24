#!/usr/bin/env bash
# File: /11-bash/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 💲 bash - GNU Bourne-Again SHell
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
_SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="bash"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/bash"
cp -i "${_SSDF_PACKAGE_DIR}/config/bashrc" "${HOME}/.bashrc"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/prompt.sh" "${HOME}/.config/bash/prompt.sh"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/shopt.sh" "${HOME}/.config/bash/shopt.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

if [ -e "${HOME}/.bashrc" ]; then
    _ssdf_append_source \
        "${HOME}/.bashrc" \
        "${HOME}/.config/shell/common.sh"
    _ssdf_append_source \
        "${HOME}/.bashrc" \
        "${HOME}/.config/bash/prompt.sh"
    _ssdf_append_source \
        "${HOME}/.bashrc" \
        "${HOME}/.config/bash/shopt.sh"
    _ssdf_append_source \
        "${HOME}/.bashrc" \
        "${HOME}/.config/bash/shopt.local.sh"
fi

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_DIR \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME
