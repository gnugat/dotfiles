#!/usr/bin/env bash
# File: /36-zsh/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# % Z shell
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="zsh"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/zsh"
cp -i "${_SSDF_PACKAGE_DIR}/config/zshrc" "${HOME}/.zshrc"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/setopt.sh" "${HOME}/.config/zsh/setopt.sh"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/envvars.zsh.sh" "${HOME}/.config/zsh/envvars.zsh.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

if [ -e "${HOME}/.zshrc" ]; then
    _ssdf_append_source \
        "${HOME}/.zshrc" \
        "${HOME}/.config/shell/common.sh"
fi

_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/zsh/envvars.zsh.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
