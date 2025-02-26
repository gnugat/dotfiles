#!/usr/bin/env bash
# File: /11-shell/config/common.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐚 Generic shell configuration (aliases, environment variables, paths).
#
# _Notes_:
# * this script should be symbolic linked in `~/.config/shell/common.sh`
# * this script should be sourced by specific shells (bash, zsh, etc)
# * the `*.local.sh` scripts are not part of the repo
# * the `*.local.sh` scripts are meant for user overrides
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_CONFIG_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
_SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_CONFIG_DIR}/../..")"

## ─────────────────────────────────────────────────────────────────────────────
## 🧭 PATH management.
## ❗ Needs to be sourced first, otherwise brew might not be detected.
## ─────────────────────────────────────────────────────────────────────────────
source "${_SSDF_PACKAGE_CONFIG_DIR}/path.sh"

if [ -f "${HOME}/.config/shell/path.local.sh" ]; then
    source "${HOME}/.config/shell/path.local.sh"
fi

## ─────────────────────────────────────────────────────────────────────────────
## 😎 ALIAS management.
## ℹ️  Some aliases are targeted at the Package Manager.
## ─────────────────────────────────────────────────────────────────────────────
source "${_SSDF_PACKAGE_CONFIG_DIR}/aliases.sh"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions/_ssdf_echo_error.sh"
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions/_ssdf_select_package_manager.sh"

_ssdf_select_package_manager

if [ "apt" = "${_SSDF_PACKAGE_MANAGER}" ]; then
    source "${_SSDF_PACKAGE_CONFIG_DIR}/aliases.apt.sh"
fi

if [ -f "${HOME}/.config/shell/aliases.local.sh" ]; then
    source "${HOME}/.config/shell/aliases.local.sh"
fi

## ─────────────────────────────────────────────────────────────────────────────
## ♻️  ENVVAR management.
## ─────────────────────────────────────────────────────────────────────────────
source "${_SSDF_PACKAGE_CONFIG_DIR}/envvars.sh"

if [ -f "${HOME}/.config/shell/envvars.local.sh" ]; then
    source "${HOME}/.config/shell/envvars.local.sh"
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────
source "${_SSDF_ROOT_DIR}/00-_ssdf/functions/_ssdf_unset_envvars.sh"

_ssdf_unset_envvars
