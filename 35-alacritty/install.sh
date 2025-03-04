#!/usr/bin/env bash
# File: /35-alacritty/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔺 Alacritty
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="alacritty"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/alacritty"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/alacritty.toml" \
    "${HOME}/.config/alacritty/alacritty.toml"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/envvars.alacritty.sh" \
    "${HOME}/.config/alacritty/envvars.alacritty.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## Adding catppuccin theme
mkdir -p "${HOME}/.config/alacritty/themes"
curl -sfLo \
    "${HOME}/.config/alacritty/themes/catppuccin-latte.toml" \
    https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-latte.toml
curl -sfLo \
    "${HOME}/.config/alacritty/themes/catppuccin-frappe.toml" \
    https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-frappe.toml
curl -sfLo \
    "${HOME}/.config/alacritty/themes/catppuccin-macchiato.toml" \
    https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-macchiato.toml
curl -sfLo \
    "${HOME}/.config/alacritty/themes/catppuccin-mocha.toml" \
    https://raw.githubusercontent.com/catppuccin/alacritty/main/catppuccin-mocha.toml

_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/alacritty/envvars.alacritty.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
