#!/usr/bin/env bash

# Super Secret Dotfiles (_SSDF)

echo '// Installing php...'
echo ' '

# SSDF Package Manager (_PCKG_MNGR) selection, if it wasn't already set
if [ -z "$_SSDF_PCKG_MNGR" ]; then
    if command -v apt >/dev/null 2>&1; then
        _SSDF_PCKG_MNGR="apt"
    else
        echo '  [Error] Current Package Manager not supported.' >&2
        echo '          Supported ones are: apt.' >&2
        exit 1
    fi
fi

# _SSDF Package (_PCKG) Current Working Directory (_CWD)
_SSDF_PCKG_CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Package's Package Manager script
_SSDF_PCKG_PCKG_MNGR_SCRPT="$_SSDF_PCKG_CWD/_${_SSDF_PCKG_MNGR}.sh"

if [ -f "$_SSDF_PCKG_PCKG_MNGR_SCRPT" ]; then
    bash "$_SSDF_PCKG_PCKG_MNGR_SCRPT"
else
    echo "  [Error] Missing Package Package Manager script '${_SSDF_PCKG_PCKG_MNGR_SCRPT}'" >&2
    exit 1
fi

# Symlink config
sudo mkdir -p /etc/php/conf.d
sudo ln -nsf $_PACKAGE_DOTFILES/config/user.ini /etc/php/conf.d/user.ini
sudo ln -nsf /etc/php/conf.d/user.ini /etc/php/8.3/cli/conf.d/42-user.ini
sudo ln -nsf /etc/php/conf.d/user.ini /etc/php/8.3/fpm/conf.d/42-user.ini

# Additional installations
curl -sS https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/local/bin/composer

unset _SSDF_PCKG_CWD _SSDF_PCKG_PCKG_MNGR_SCRPT

echo ' '
echo ' [OK] php installed'
echo ' '
