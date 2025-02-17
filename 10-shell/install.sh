#!/usr/bin/env bash
# File: /10-shell/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐚 Generic shell stuff that can apply to bash, zsh, etc.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd -P)"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="shell"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME} stuff (generic)..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

# N/A

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/shell"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/common.sh" "${HOME}/.config/shell/common.sh"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/aliases.sh" "${HOME}/.config/shell/aliases.sh"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/aliases.apt.sh" "${HOME}/.config/shell/aliases.apt.sh"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/envvars.sh" "${HOME}/.config/shell/envvars.sh"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/path.sh" "${HOME}/.config/shell/path.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

# Ensure supported shells source the main generic shell config
for _SSDF_SUPPORTED_SHELL in \
    "${HOME}/.bashrc" \
    "${HOME}/.zshrc" \
    "${HOME}/.profile"
do
    if [ -f "${_SSDF_SUPPORTED_SHELL}" ]; then
        _ssdf_append_source \
            "${_SSDF_SUPPORTED_SHELL}" \
            "${HOME}/.config/shell/common.sh"
    fi
done

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_DIR \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME \
    _SSDF_SUPPORTED_SHELL
