#!/usr/bin/env bash
# File: /tree/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🌳 tree - list contents of directories in a tree-like format.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd -P)"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="tree"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/tree"
ln -nsf "${_SSDF_PACKAGE_DIR}/config/aliases.tree.sh" "${HOME}/.config/tree/aliases.tree.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_append_source \
    "${HOME}/.config/shell/aliases.local.sh" \
    "source ${HOME}/.config/tree/aliases.tree.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_DIR \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME
