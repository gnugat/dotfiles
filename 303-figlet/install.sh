#!/usr/bin/env bash
# File: /303-figlet/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🖥️ FIGlet
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="figlet"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p ~/.config/figlet/fonts
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/aliases.figlet.sh" \
    "${HOME}/.config/figlet/aliases.figlet.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_append_source \
    "${HOME}/.config/shell/aliases.local.sh" \
    "${HOME}/.config/figlet/aliases.figlet.sh"

## Installing custom fonts
_SSDF_OLD_IFS="${IFS}"
IFS=$'\n'

_SSDF_FIGLET_CUSTOM_FONTS="
3d
ANSI Regular
ANSI Shadow
Def Leppard
Delta Corps Priest 1
DOS Rebel
Georgia11
miniwi
Univers
"
for _SSDF_FIGLET_CUSTOM_FONT in $_SSDF_FIGLET_CUSTOM_FONTS; do
    _SSDF_FIGLET_URL_ENCODED_FONT="${_SSDF_FIGLET_CUSTOM_FONT// /%20}"

    curl -sfLo "${HOME}/.config/figlet/fonts/${_SSDF_FIGLET_CUSTOM_FONT}.flf" \
        "https://raw.githubusercontent.com/xero/figlet-fonts/master/${_SSDF_FIGLET_URL_ENCODED_FONT}.flf"
done

IFS="${_SSDF_OLD_IFS}"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
