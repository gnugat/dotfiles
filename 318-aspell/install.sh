#!/usr/bin/env bash
# File: /318-aspell/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# ✍️ aspell
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="aspell"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/aspell"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/aspell.conf" \
    "${HOME}/.config/aspell/aspell.conf"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/en.prepl" \
    "${HOME}/.config/aspell/en.prepl"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/en.pws" \
    "${HOME}/.config/aspell/en.pws"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/envvars.aspell.sh" \
    "${HOME}/.config/aspell/envvars.aspell.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/aspell/envvars.aspell.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
