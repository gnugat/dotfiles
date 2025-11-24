#!/usr/bin/env bash
# File: /22-php/install.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐘 php - the uncanny Personal Home Page programming language.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_DIR}/..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_SSDF_PACKAGE_NAME="php"

_ssdf_echo_section_title "Installing ${_SSDF_PACKAGE_NAME}..."

## ─────────────────────────────────────────────────────────────────────────────
## ⬅️  Initialisation steps.
## ─────────────────────────────────────────────────────────────────────────────

## If not provided, setting PHP version to defaults
export SSDF_PHP_VERSION="${SSDF_PHP_VERSION:-8.3}"

## Saving PHP version preference
mkdir -p "${HOME}/.config/php"
_ssdf_append_envvar \
    "${HOME}/.config/php/envvars.php.sh" \
    "SSDF_PHP_VERSION" \
    "${SSDF_PHP_VERSION}"
_ssdf_append_source \
    "${HOME}/.config/shell/envvars.local.sh" \
    "${HOME}/.config/php/envvars.php.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Call to `./_<package-manager>.sh` script.
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_select_package_manager
_ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"

## ─────────────────────────────────────────────────────────────────────────────
## 🔗 Symbolic links.
## ─────────────────────────────────────────────────────────────────────────────

## Homebrew uses different location depending on the system / architecture
_SSDF_BREW_MAC_ARM64="/opt/homebrew/etc/php/${SSDF_PHP_VERSION}"
_SSDF_BREW_MAC_X86_64="/usr/local/etc/php/${SSDF_PHP_VERSION}"
_SSDF_BREW_LINUX="${HOME}/.linuxbrew/etc/php/${SSDF_PHP_VERSION}"
_SSDF_APT_UBUNTU="/etc/php/${SSDF_PHP_VERSION}"
if [[ "${SSDF_PACKAGE_MANAGER}" == "brew" && -d "${_SSDF_BREW_MAC_ARM64}" ]]; then
    sudo ln -nsf \
        "${_SSDF_PACKAGE_DIR}/config/42-user.ini" \
        "${_SSDF_BREW_MAC_ARM64}/conf.d/42-user.ini"

elif [[ "${SSDF_PACKAGE_MANAGER}" == "brew" && -d "${_SSDF_BREW_MAC_X86_64}" ]]; then
    sudo ln -nsf \
        "${_SSDF_PACKAGE_DIR}/config/42-user.ini" \
        "${_SSDF_BREW_MAC_X86_64}/conf.d/42-user.ini"

elif [[ "${SSDF_PACKAGE_MANAGER}" == "brew" && -d "${_SSDF_BREW_LINUX}" ]]; then
    # No need for `sudo` in `~/.linuxbrew`
    ln -nsf \
        "${_SSDF_PACKAGE_DIR}/config/42-user.ini" \
        "${_SSDF_BREW_LINUX}/conf.d/42-user.ini"
    
elif [[ "${SSDF_PACKAGE_MANAGER}" == "apt" && -d "${_SSDF_APT_UBUNTU}" ]]; then
    ## Ubuntu uses multiple locations depending on PHP's "flavour"
    ## (cli, fpm, or -- god forbid -- apache)
    sudo ln -nsf \
        "${_SSDF_PACKAGE_DIR}/config/42-user.ini" \
        "${_SSDF_APT_UBUNTU}/cli/conf.d/42-user.ini"
    sudo ln -nsf \
        "${_SSDF_PACKAGE_DIR}/config/42-user.ini" \
        "${_SSDF_APT_UBUNTU}/fpm/conf.d/42-user.ini"
else
    _ssdf_echo_error "Could not find a valid PHP config directory for ${SSDF_PACKAGE_MANAGER}."
    exit 1
fi

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Additional config / install
## ─────────────────────────────────────────────────────────────────────────────

## Composer
if ! command -v "composer" >/dev/null 2>&1; then
    curl -sS https://getcomposer.org/installer | php > /dev/null \
        && sudo mkdir -p /usr/local/bin \
        && sudo mv composer.phar /usr/local/bin/composer
fi

## PIE
if ! command -v "pie" >/dev/null 2>&1; then
    curl -fsSL -O https://github.com/php/pie/releases/latest/download/pie.phar \
        && sudo mv pie.phar /usr/local/bin/pie \
        && sudo chmod +x /usr/local/bin/pie
fi

## Install PHP extensions via PIE
if command -v "pie" >/dev/null 2>&1; then
    pie install --working-dir="${_SSDF_PACKAGE_DIR}/config"
fi

_ssdf_echo_success "${_SSDF_PACKAGE_NAME} installed"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
