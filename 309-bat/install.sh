#!/usr/bin/env bash
# File: /309-bat/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🦇 Bat
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="bat"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/bat"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/config" \
    "${HOME}/.config/bat/config"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/aliases.bat.sh" \
    "${HOME}/.config/bat/aliases.bat.sh"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/envvars.bat.sh" \
    "${HOME}/.config/bat/envvars.bat.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_append_source \
    "${HOME}/.config/shell/aliases.local.sh" \
    "${HOME}/.config/bat/aliases.bat.sh"

## Adding catppuccin theme
mkdir -p "${HOME}/.config/bat/themes"
curl -sfLo \
    "${HOME}/.config/bat/themes/catppuccin-latte.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Latte.tmTheme
curl -sfLo \
    "${HOME}/.config/bat/themes/catppuccin-frappe.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Frappe.tmTheme
curl -sfLo \
    "${HOME}/.config/bat/themes/catppuccin-macchiato.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Macchiato.tmTheme
curl -sfLo \
    "${HOME}/.config/bat/themes/catppuccin-mocha.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build || batcat cache --build

_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/bat/envvars.bat.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
