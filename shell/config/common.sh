#!/usr/bin/env bash
# File: /shell/config/common.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐚 Generic shell configuration (aliases, environment variables, paths).
#
# _Notes_:
# * this script should be symbolic linked in `~/.config/shell/common.sh`
# * this script should be sourced by specific shells (bash, zsh, etc)
# * the `*.local.sh` scripts are not part of the repo
# * the `*.local.sh` scripts are meant for user overrides
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_CONFIG_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
_ssdf_select_package_manager

## ─────────────────────────────────────────────────────────────────────────────
## 😎 ALIAS management.
## ─────────────────────────────────────────────────────────────────────────────
source "${_SSDF_PACKAGE_CONFIG_DIR}/aliases.sh"

if [ "${_SSDF_PACKAGE_MANAGER}" == "apt" ]; then
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
## 🧭 PATH management.
## ─────────────────────────────────────────────────────────────────────────────
source "${_SSDF_PACKAGE_CONFIG_DIR}/path.sh"

if [ -f "${HOME}/.config/shell/path.local.sh" ]; then
    source "${HOME}/.config/shell/path.local.sh"
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_CONFIG_DIR
