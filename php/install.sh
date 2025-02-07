#!/usr/bin/env bash

_SSDF_PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
_SSDF_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd )"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

_SSDF_PACKAGE_NAME="php"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

# Call `./_<package-manager>.sh` script
_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

# Symlink config
## Homebrew uses different location depending on the system / architecture
_SSDF_BREW_MAC_ARM64="/opt/homebrew/etc/php/8.3"
_SSDF_BREW_MAC_X86_64="/usr/local/etc/php/8.3"
_SSDF_BREW_LINUX="${HOME}/.linuxbrew/etc/php/8.3"
_SSDF_APT_UBUNTU="/etc/php/8.3"
if [[ "${_SSDF_PACKAGE_MANAGER}" == "brew" && -d "${_SSDF_BREW_MAC_ARM64}" ]]; then
    sudo ln -nsf "${_SSDF_PACKAGE_DIR}/config/42-user.ini" "${_SSDF_BREW_MAC_ARM64}/conf.d/42-user.ini"
elif [[ "${_SSDF_PACKAGE_MANAGER}" == "brew" && -d "${_SSDF_BREW_MAC_X86_64}" ]]; then
    sudo ln -nsf "${_SSDF_PACKAGE_DIR}/config/42-user.ini" "${_SSDF_BREW_MAC_X86_64}/conf.d/42-user.ini"
elif [[ "${_SSDF_PACKAGE_MANAGER}" == "brew" && -d "${_SSDF_BREW_LINUX}" ]]; then
    # No need for `sudo` in `~/.linuxbrew`
    ln -nsf "${_SSDF_PACKAGE_DIR}/config/42-user.ini" "${_SSDF_BREW_LINUX}/conf.d/42-user.ini"
elif [[ "${_SSDF_PACKAGE_MANAGER}" == "apt" && -d "${_SSDF_APT_UBUNTU}" ]]; then
    ## Ubuntu uses multiple locations depending on PHP's "flavour" (cli, fpm, or -- god forbid -- apache)
    sudo ln -nsf "${_SSDF_PACKAGE_DIR}/config/42-user.ini" "${_SSDF_APT_UBUNTU}/cli/conf.d/42-user.ini"
    sudo ln -nsf "${_SSDF_PACKAGE_DIR}/config/42-user.ini" "${_SSDF_APT_UBUNTU}/fpm/conf.d/42-user.ini"
else
    _ssdf_echo_error "Could not find a valid PHP config directory for ${_SSDF_PACKAGE_MANAGER}."
    exit 1
fi

# Additional config/install
## Composer
curl -sS https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/local/bin/composer

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

unset _SSDF_PACKAGE_DIR _SSDF_ROOT_DIR _SSDF_PACKAGE_NAME \
    _SSDF_BREW_MAC_ARM64 _SSDF_BREW_MAC_X86_64 _SSDF_BREW_LINUX _SSDF_APT_UBUNTU
