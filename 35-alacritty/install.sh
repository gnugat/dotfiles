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
##
## Backward compatibility break in v0.14:
## * `import` config got moved to `general` new section
## Use `alacritty.old.toml` for older versions (eg Ubuntu < 25.04 Plucky Puffin)
## ─────────────────────────────────────────────────────────────────────────────

_SSDF_ALACRITTY_VERSION=$(alacritty --version | grep -o '[0-9]\+\.[0-9]\+')
_SSDF_ALACRITTY_VERSION_MAJOR=$(echo "$_SSDF_ALACRITTY_VERSION" | cut -d. -f1)
_SSDF_ALACRITTY_VERSION_MINOR=$(echo "$_SSDF_ALACRITTY_VERSION" | cut -d. -f2)

_SSDF_ALACRITTY_CONFIG_FILE='alacritty.toml'
if [ "${_SSDF_ALACRITTY_VERSION_MAJOR}" -eq 0 ] && [ "${_SSDF_ALACRITTY_VERSION_MINOR}" -lt 14 ]; then
    _SSDF_ALACRITTY_CONFIG_FILE='alacritty.old.toml'
fi

mkdir -p "${HOME}/.config/alacritty"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/${_SSDF_ALACRITTY_CONFIG_FILE}" \
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
