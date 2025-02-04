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
sudo mkdir -p /etc/php/conf.d
sudo ln -nsf "${_SSDF_PACKAGE_DIR}/config/user.ini" /etc/php/conf.d/user.ini
sudo ln -nsf /etc/php/conf.d/user.ini /etc/php/8.3/cli/conf.d/42-user.ini
sudo ln -nsf /etc/php/conf.d/user.ini /etc/php/8.3/fpm/conf.d/42-user.ini

# Additional config/install
## Composer
curl -sS https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/local/bin/composer

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

unset _SSDF_PACKAGE_DIR _SSDF_ROOT_DIR _SSDF_PACKAGE_NAME
