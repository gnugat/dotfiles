#!/usr/bin/env bash
# File: /install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔵 Super Secret Dot Files.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_ROOT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
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
## 🏷️ Selects the tags, by setting `_SSDF_TAGS`.
## _Note_: The tags can be manually selected as follow:
##
## ```
## _SSDF_TAGS='0 1' bash install.sh
## ```
##
## Package folders follow this naming convention: `<xy>-<package-name>`.
## The `<xy>` prefix digit indicates the package's:
## * `x`: tag (category)
##     * 0: 🏭 internal SSDF functions
##     * 1: 🫗 bare minimum (ideal for ssh servers, or Docker Containers)
##     * 2: 🧱 base minimal (common set up)
## * `y`: execution priority (in numeric-alphabetical order)
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_echo_section_title 'Selecting Tags'

if [ -z "${_SSDF_TAGS}" ]; then
    _SSDF_TAGS='0 1 2'
fi

_ssdf_echo_success "Tags ${_SSDF_TAGS} selected"

## ─────────────────────────────────────────────────────────────────────────────
## 📰 System update.
## ─────────────────────────────────────────────────────────────────────────────

if [ "${_SSDF_PACKAGE_MANAGER}" == "apt" ]; then
    _ssdf_echo_section_title 'Updating Package Manager...'
    sudo apt-get -qq update
    _ssdf_echo_success "Package Manager updated"
fi

## ─────────────────────────────────────────────────────────────────────────────
## ➕ For each package matching the selected tags, call its `install.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

for _SSDF_PACKAGE_DIR in "${_SSDF_ROOT_DIR}"/*/; do
    _SSDF_PACKAGE_TAGGED_NAME="$(basename "${_SSDF_PACKAGE_DIR}")"

    # Extract the tag (first digit of the folder name)
    _SSDF_PACKAGE_TAG="${_SSDF_PACKAGE_TAGGED_NAME:0:1}"

    # Check if the tag is in the allowed list
    if [[ " ${_SSDF_TAGS} " == *" ${_SSDF_PACKAGE_TAG} "* ]]; then
        _SSDF_PACKAGE_INSTALL="${_SSDF_PACKAGE_DIR}install.sh"
        if [ -f "${_SSDF_PACKAGE_INSTALL}" ]; then
            bash "${_SSDF_PACKAGE_INSTALL}" -H || break
        fi
    fi
done

_ssdf_echo_success 'Super Secret Dotfiles installed'

echo ' Now please run `source ~/.profile` to apply'
echo ' ' 

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars

unset _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_MANAGER \
    _SSDF_TAGS
