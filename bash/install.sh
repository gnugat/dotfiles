#!/usr/bin/env bash

_SSDF_PACKAGE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd )"
_SSDF_ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd )"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

_SSDF_PACKAGE_NAME="bash"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

# Call `./_<package-manager>.sh` script
_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

# Symlink config
## N/A

# Additional config/install
## @TODO Do something better than just continously adding more and more to .bashrc
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/main" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/main" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

## Aliases
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/aliases" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/aliases" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

# Environment variables
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/envvars" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/envvars" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

# PATH
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/path" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/path" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

# Super Secret Prompt
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/prompt" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/prompt" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

unset _SSDF_PACKAGE_DIR _SSDF_ROOT_DIR _SSDF_PACKAGE_NAME
