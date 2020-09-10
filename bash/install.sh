#!/usr/bin/env bash

_BASH_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '//  Configuring bash...'

echo '' >> ~/.bashrc
echo "if [ -f $_BASH_DOTFILES/config/main ];then" >> ~/.bashrc
echo "    . $_BASH_DOTFILES/config/main" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_BASH_DOTFILES/config/aliases ];then" >> ~/.bashrc
echo "    . $_BASH_DOTFILES/config/aliases" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_BASH_DOTFILES/config/envvars ];then" >> ~/.bashrc
echo "    . $_BASH_DOTFILES/config/envvars" >> ~/.bashrc
echo 'fi' >> ~/.bashrc
echo '' >> ~/.bashrc
echo "if [ -f $_BASH_DOTFILES/config/prompt ];then" >> ~/.bashrc
echo "    . $_BASH_DOTFILES/config/prompt" >> ~/.bashrc
echo 'fi' >> ~/.bashrc

unset _BASH_DOTFILES

echo ' '
echo ' [OK] bash configured'
echo ' '
