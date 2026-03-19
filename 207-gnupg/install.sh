#!/usr/bin/env bash
# File: /207-gnupg/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔐 GPG
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="gnupg"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/gnupg"
chmod 700 "${HOME}/.config/gnupg"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/envvars.gnupg.sh" \
    "${HOME}/.config/gnupg/envvars.gnupg.sh"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/gpg-agent.conf" \
    "${HOME}/.config/gnupg/gpg-agent.conf"

chmod 600 "${HOME}/.config/gnupg"/*

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/gnupg/envvars.gnupg.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
