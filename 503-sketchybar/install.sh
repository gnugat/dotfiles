#!/usr/bin/env bash
# File: /503-sketchybar/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🖼️ SketchyBar
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="sketchybar"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/sketchybar"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/sketchybarrc" \
    "${HOME}/.config/sketchybar/sketchybarrc"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/themes" \
    "${HOME}/.config/sketchybar/themes"

ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/items" \
    "${HOME}/.config/sketchybar/items"

ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/plugins" \
    "${HOME}/.config/sketchybar/plugins"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
