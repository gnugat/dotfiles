#!/usr/bin/env bash

echo ' '
echo 'Super Secret Dotfiles (_SSDF)'
echo '============================'
echo 'Backup, restore and sync shell / system prefs and settings'
echo '----------------------------------------------------------'

# _SSDF Package Manager (_PCKG_MNGR) selection
# It can be manually selected as follow: `_SSDF_PCKG_MNGR=apt bash ./install.sh`
echo ' '
echo '// Selecting Package Manager (_SSDF_PCKG_MNGR)...'

# If it wasn't manually selected, then automatically pick one
if [ -z "$_SSDF_PCKG_MNGR" ]; then
    if command -v apt >/dev/null 2>&1; then
        _SSDF_PCKG_MNGR="apt"
    else
        echo '  [Error] Current Package Manager not supported.' >&2
        echo '          Supported ones are: apt.' >&2
        exit 1
    fi
fi
export _SSDF_PCKG_MNGR

echo ' '
echo " [OK] Package manager $_SSDF_PCKG_MNGR selected"

# Package Manager update
echo ' '
echo '// Updating Package Manager...'
if [ "$_SSDF_PCKG_MNGR" = "apt" ]; then
    echo ' '
    sudo apt-get -qq update
fi

echo ' '
echo " [OK] Package manager updated"
echo ' '

# _SSDF Current Working Directory (_CWD)
_SSDF_CWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# For each Package (_PCKG), call its `install.sh` script
for _SSDF_PCKG_INSTALL in $_SSDF_CWD/*/install.sh; do
  bash "$_SSDF_PCKG_INSTALL" -H || break
done

# Clean local environment variables
unset _SSDF_PCKG_MNGR _SSDF_CWD _SSDF_PCKG_INSTALL

echo ' '
echo ' [OK] Super Secret Dotfiles installed'
echo '      Run `source ~/.profile` to reload config' 
echo ' '

