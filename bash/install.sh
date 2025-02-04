#!/usr/bin/env bash

# Super Secret Dotfiles (_SSDF)

echo '// Installing bash...'
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
echo '' >> ~/.bashrc
echo "if [ -f $_PACKAGE_DOTFILES/config/main ];then" >> ~/.bashrc
echo "    . $_PACKAGE_DOTFILES/config/main" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_PACKAGE_DOTFILES/config/aliases ];then" >> ~/.bashrc
echo "    . $_PACKAGE_DOTFILES/config/aliases" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_PACKAGE_DOTFILES/config/envvars ];then" >> ~/.bashrc
echo "    . $_PACKAGE_DOTFILES/config/envvars" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_PACKAGE_DOTFILES/config/path ];then" >> ~/.bashrc
echo "    . $_PACKAGE_DOTFILES/config/path" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_PACKAGE_DOTFILES/config/prompt ];then" >> ~/.bashrc
echo "    . $_PACKAGE_DOTFILES/config/prompt" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

# Additional installations

unset _SSDF_PCKG_CWD _SSDF_PCKG_PCKG_MNGR_SCRPT

echo ' '
echo ' [OK] bash installed'
echo ' '
