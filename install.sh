#!/usr/bin/env bash
# File: /install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔵 Super Secret Dot Files.
# ──────────────────────────────────────────────────────────────────────────────

SSDF_ROOT_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

echo ' '
echo 'Super Secret Dotfiles (_SSDF)'
echo '============================'
echo 'Backup, restore and sync shell / system prefs and settings'
echo '----------------------------------------------------------'

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Selects the Package Manager, by setting `SSDF_PACKAGE_MANAGER`.
## _Note_: The package manager can be manually selected as follow:
##
## ```
## SSDF_PACKAGE_MANAGER=apt bash install.sh
## ```
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_echo_section_title 'Selecting Package Manager'
_ssdf_select_package_manager
_ssdf_echo_success "Package Manager ${SSDF_PACKAGE_MANAGER} selected"


## ─────────────────────────────────────────────────────────────────────────────
## 🏷️ Selects the tags, by setting `SSDF_TAGS`.
## _Note_: The tags can be manually selected as follow:
##
## ```
## SSDF_TAGS='0 1' bash install.sh
## ```
##
## Package folders follow this naming convention: `<xy>-<package-name>`.
## The `<xy>` prefix digit indicates the package's:
## * `x`: tag (category)
##     * `0`: 🏭 Internal SSDF functions
##     * `1`: 🧸 Bare minimum (ideal for ssh servers, or Docker Containers)
##     * `2`: 🧱 Base minimal (common set up)
##     * `3`: 💥 Bang (productivity, common)
##     * `4`: 🍊 Ubuntu (OS specific)
## * `y`: execution priority (in numeric-alphabetical order)
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_echo_section_title 'Selecting Tags'

if [ -z "${SSDF_TAGS}" ]; then
    SSDF_TAGS='0 1 2 3 4'
fi

_ssdf_echo_success "Tags ${SSDF_TAGS} selected"

## ─────────────────────────────────────────────────────────────────────────────
## 📰 System update.
## ─────────────────────────────────────────────────────────────────────────────

if [ "${SSDF_PACKAGE_MANAGER}" == "apt" ]; then
    _ssdf_echo_section_title 'Updating Package Manager...'
    sudo apt-get -qq update
    _ssdf_echo_success "Package Manager updated"
fi

## ─────────────────────────────────────────────────────────────────────────────
## ➕ For each package matching the selected tags, call its `install.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

for _SSDF_PACKAGE_DIR in "${SSDF_ROOT_DIR}"/*/; do
    _SSDF_PACKAGE_TAGGED_NAME="$(basename "${_SSDF_PACKAGE_DIR}")"

    # Extract the tag (first digit of the folder name)
    _SSDF_PACKAGE_TAG="${_SSDF_PACKAGE_TAGGED_NAME:0:1}"

    # Check if the tag is in the allowed list
    if [[ " ${SSDF_TAGS} " == *" ${_SSDF_PACKAGE_TAG} "* ]]; then
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

unset SSDF_ROOT_DIR \
    SSDF_PACKAGE_MANAGER \
    SSDF_TAGS
