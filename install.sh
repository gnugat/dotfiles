#!/usr/bin/env bash
# File: /install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔵 Super Secret Dot Files.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

echo ' '
echo 'Super Secret Dotfiles (_SSDF)'
echo '============================'
echo 'Backup, restore and sync shell / system prefs and settings'
echo '----------------------------------------------------------'

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Selects the Package Manager, by setting `_SSDF_PACKAGE_MANAGER`.
## _Note_: The package manager can be manually selected as follow:
##
## ```
## _SSDF_PACKAGE_MANAGER=apt bash install.sh
## ```
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_echo_section_title 'Selecting Package Manager'
_ssdf_select_package_manager
_ssdf_echo_success "Package Manager ${_SSDF_PACKAGE_MANAGER} selected"

## ─────────────────────────────────────────────────────────────────────────────
## 📰 System update.
## ─────────────────────────────────────────────────────────────────────────────

if [ "${_SSDF_PACKAGE_MANAGER}" == "apt" ]; then
    _ssdf_echo_section_title 'Updating Package Manager...'
    sudo apt-get -qq update
    _ssdf_echo_success "Package Manager updated"
fi

## ─────────────────────────────────────────────────────────────────────────────
## ➕ For each Package, call its `install.sh` script
## ─────────────────────────────────────────────────────────────────────────────

for _SSDF_PACKAGE_INSTALL in ${_SSDF_ROOT_DIR}/*/install.sh; do
    bash "${_SSDF_PACKAGE_INSTALL}" -H || break
done

_ssdf_echo_success 'Super Secret Dotfiles installed (now please run `source ~/.profile`)'

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_NAME \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_INSTALL

