#!/usr/bin/env bash
# File: /bash/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 💲 bash - GNU Bourne-Again SHell
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"
_SSDF_ROOT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd -P)"
source "${_SSDF_ROOT_DIR}/_ssdf_func.sh"

_SSDF_PACKAGE_NAME="bash"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

## N/A

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## @TODO Do something better than just continously adding more and more to .bashrc
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/main" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/main" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

## Super Secret Prompt
echo '' >> ~/.bashrc
echo "if [ -f "${_SSDF_PACKAGE_DIR}/config/prompt" ];then" >> ~/.bashrc
echo "    . ${_SSDF_PACKAGE_DIR}/config/prompt" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PACKAGE_DIR \
    _SSDF_ROOT_DIR \
    _SSDF_PACKAGE_NAME
