#!/usr/bin/env bash
# File: /{{ _SSDF_INPUT_PACKAGE_ID }}-{{ _SSDF_INPUT_PACKAGE_NAME }}/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# {{ _SSDF_INPUT_PACKAGE_EMOJI }} {{ _SSDF_INPUT_PACKAGE_TITLE }}
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="{{ _SSDF_INPUT_PACKAGE_NAME }}"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/{{ _SSDF_INPUT_PACKAGE_NAME }}"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/{{ _SSDF_INPUT_PACKAGE_NAME }}rc" \
    "${HOME}/.config/{{ _SSDF_INPUT_PACKAGE_NAME }}/{{ _SSDF_INPUT_PACKAGE_NAME }}rc"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/aliases.{{ _SSDF_INPUT_PACKAGE_NAME }}.sh" \
    "${HOME}/.config/{{ _SSDF_INPUT_PACKAGE_NAME }}/aliases.{{ _SSDF_INPUT_PACKAGE_NAME }}.sh"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/envvars.{{ _SSDF_INPUT_PACKAGE_NAME }}.sh" \
    "${HOME}/.config/{{ _SSDF_INPUT_PACKAGE_NAME }}/envvars.{{ _SSDF_INPUT_PACKAGE_NAME }}.sh"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## N/A

_ssdf_append_source \
    "${HOME}/.config/shell/aliases.local.sh" \
    "${HOME}/.config/{{ _SSDF_INPUT_PACKAGE_NAME }}/aliases.{{ _SSDF_INPUT_PACKAGE_NAME }}.sh"
_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/{{ _SSDF_INPUT_PACKAGE_NAME }}/envvars.{{ _SSDF_INPUT_PACKAGE_NAME }}.sh"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
