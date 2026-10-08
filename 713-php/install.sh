#!/usr/bin/env bash
# File: /713-php/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐘 php - Tarakava specific extensions.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="php (tarakava extensions)"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

## N/A

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## PHP and PIE are installed by `202-php`
if ! command -v "pie" >/dev/null 2>&1; then
    _ssdf_echo_error "pie not found, please install 202-php first."
    exit 1
fi

## Extensions requiring configure options, which `config/composer.json` can't
## provide, are installed first (PIE then skips them as already loaded)

## rdkafka needs the librdkafka path
if ! php -r 'exit(extension_loaded("rdkafka") ? 0 : 1);'; then
    pie install -n 'rdkafka/rdkafka:^6.0' \
        --with-rdkafka="$(brew --prefix librdkafka)"
fi

## Install PHP extensions via PIE
pie install --working-dir="${_SSDF_PACKAGE_DIR}/config"

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
