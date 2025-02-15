#!/usr/bin/env bash
# File: /git/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐙 git - the stupid content tracker
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd -P)"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

_SSDF_PACKAGE_NAME="git"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p ~/.config/git
ln -nsf "${_SSDF_PACKAGE_DIR}/config/user" ~/.config/git/user
ln -nsf "${_SSDF_PACKAGE_DIR}/config/gitconfig" ~/.gitconfig
ln -nsf "${_SSDF_PACKAGE_DIR}/config/gitglobalexclude" ~/.gitglobalexclude
ln -nsf "${_SSDF_PACKAGE_DIR}/config/gittemplate" ~/.gittemplate

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## N/A

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_DIR \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME

