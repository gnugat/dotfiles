#!/usr/bin/env bash
# File: /vim/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# ✌️ vim - Vi IMproved, this programmer's text editor
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd -P)"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

_SSDF_PACKAGE_NAME="vim"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

ln -nsf "${_SSDF_PACKAGE_DIR}/config/vimrc" ~/.vimrc

# Additional config/install

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## vim-plug: minimalist vim plugin manager
if [ ! -e ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    vim +PlugInstall +qall
fi

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_DIR \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME

