#!/usr/bin/env bash
# File: /39-bat/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🦇 Bat
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

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

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## Adding catpuccin theme
mkdir -p "${HOME}/.config/bat/themes"
curl -sfLo \
    "${HOME}/.config/bat/themes/catpuccin-latte.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Latte.tmTheme
curl -sfLo \
    "${HOME}/.config/bat/themes/catpuccin-frappe.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Frappe.tmTheme
curl -sfLo \
    "${HOME}/.config/bat/themes/catpuccin-macchiato.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Macchiato.tmTheme
curl -sfLo \
    "${HOME}/.config/bat/themes/catpuccin-mocha.tmTheme" \
    https://raw.githubusercontent.com/catppuccin/bat/main/themes/Catppuccin%20Mocha.tmTheme
bat cache --build

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
