#!/usr/bin/env bash

_GIT_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '//  Installing git...'

ln -nsf $_GIT_DOTFILES/config/main ~/.gitconfig
ln -nsf $_GIT_DOTFILES/config/global_exclude ~/.gitglobalexclude
ln -nsf $_GIT_DOTFILES/config/template ~/.gittemplate

echo ' '
echo ' [OK] git installed'
echo ' '

unset _GIT_DOTFILES
