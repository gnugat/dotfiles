#!/usr/bin/env bash
# File: /315-tmux/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👕 tmux
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="tmux"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

mkdir -p "${HOME}/.config/tmux"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/tmux.conf" \
    "${HOME}/.config/tmux/tmux.conf"

## Items are smaller, specific, configuration settings
mkdir -p "${HOME}/.config/tmux/items"
ln -nsf \
    "${_SSDF_PACKAGE_DIR}/config/items/status-line.conf" \
    "${HOME}/.config/tmux/items/status-line.conf"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## TPM and plugins
mkdir -p "${HOME}/.config/tmux/plugins"
if [ ! -e "${HOME}/.config/tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm "${HOME}/.config/tmux/plugins/tpm"
    bash "${HOME}/.config/tmux/plugins/tpm/bin/install_plugins" all
fi
bash "${HOME}/.config/tmux/plugins/tpm/bin/update_plugins" all

## Install Catppuccin theme manually (recommended approach)
if [ ! -e "${HOME}/.config/tmux/plugins/catppuccin" ]; then
    git clone https://github.com/catppuccin/tmux "${HOME}/.config/tmux/plugins/catppuccin"
fi
(cd "${HOME}/.config/tmux/plugins/catppuccin" && git pull)

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
