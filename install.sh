#!/usr/bin/env bash

_SSDF_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

echo ' '
echo 'Super Secret Dotfiles (_SSDF)'
echo '============================'
echo 'Backup, restore and sync shell / system prefs and settings'
echo '----------------------------------------------------------'

# Checks _SSDF_PACKAGE_MANAGER if it has been passed to the script
#   eg via `_SSDF_PACKAGE_MANAGER=apt bash install.sh`
# If it wasn't, then ensure _SSDF_PACKAGE_MANAGER is set with system's Package Manager.
_ssdf_echo_section_title 'Selecting Package Manager'
_ssdf_select_package_manager
_ssdf_echo_success "Package Manager ${_SSDF_PACKAGE_MANAGER} selected"

# Package Manager update
if [ "$_SSDF_PACKAGE_MANAGER" = "apt" ]; then
    _ssdf_echo_section_title 'Updating Package Manager...'
    sudo apt-get -qq update
    _ssdf_echo_success "Package Manager updated"
fi

# For each Package, call its `install.sh` script
for _SSDF_PACKAGE_INSTALL in $_SSDF_ROOT_DIR/*/install.sh; do
  bash "${_SSDF_PACKAGE_INSTALL}" -H || break
done

# Clean local environment variables
unset _SSDF_PACKAGE_NAME _SSDF_ROOT_DIR _SSDF_PACKAGE_INSTALL

_ssdf_echo_success 'Super Secret Dotfiles installed (now please run `source ~/.profile`)'
