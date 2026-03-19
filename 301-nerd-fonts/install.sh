#!/usr/bin/env bash
# File: /301-nerd-fonts/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🤓 Nerd Fonts
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="nerd-fonts"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## ⬅️  Initialisation steps.
## ─────────────────────────────────────────────────────────────────────────────

## If not provided, setting Nerd Fonts to defaults
_SSDF_NERD_FONTS_DEFAULT="
JetBrainsMono
"
export SSDF_NERD_FONTS="${SSDF_NERD_FONTS:-$_SSDF_NERD_FONTS_DEFAULT}"

## Saving nerd fonts preference
mkdir -p "${HOME}/.config/nerd-fonts"
_ssdf_append_envvar \
    "${HOME}/.config/nerd-fonts/envvars.nerd-fonts.sh" \
    "SSDF_NERD_FONTS" \
    "${SSDF_NERD_FONTS}"
_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/nerd-fonts/envvars.nerd-fonts.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/nerd-fonts/bin"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/bin/test-nerd-fonts.sh" \
    "${HOME}/.config/nerd-fonts/bin/test-nerd-fonts.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## N/A

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
