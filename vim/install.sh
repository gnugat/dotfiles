#!/usr/bin/env bash

_SSDF_PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
_SSDF_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd )"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

_SSDF_PACKAGE_NAME="vim"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

# Call `./_<package-manager>.sh` script
_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

# Symlink config
ln -nsf "${_SSDF_PACKAGE_DIR}/config/vimrc" ~/.vimrc

# Additional config/install
## vim-plug: minimalist vim plugin manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

unset _SSDF_PACKAGE_DIR _SSDF_ROOT_DIR _SSDF_PACKAGE_NAME
