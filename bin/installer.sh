#!/bin/bash

NOCOLOR='\e[0m'
REDCOLOR='\e[37;41m'

if [[ $EUID -ne 0 ]]; then
   echo -e "$REDCOLOR Think to run this bash script as root$NOCOLOR"
    IS_ROOT=0
else
    IS_ROOT=1
fi

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"

echo 'Create $HOME symlink'
ln -nsf {$DOTFILES,$HOME}/.ackrc
ln -nsf {$DOTFILES,$HOME}/.bash_aliases
ln -nsf {$DOTFILES,$HOME}/.bashrc
ln -nsf {$DOTFILES,$HOME}/.gitconfig
ln -nsf {$DOTFILES,$HOME}/.profile
ln -nsf {$DOTFILES,$HOME}/.vimrc
if [[ ! -d ~/.bash ]]; then
    ln -nsf {$DOTFILES,$HOME}/.bash
fi
if [[ ! -d ~/.git-template ]]; then
    ln -nsf {$DOTFILES,$HOME}/.git-template
fi

echo 'Install git submodule'
if type -t git &> /dev/null; then
  git submodule update --init
  ln -nsf $DOTFILES/dircolors-solarized/dircolors.ansi-dark ~/.dir_colors
fi

echo 'Install fossil'
curl -sS https://raw.github.com/gnugat/fossil/master/bin/installer.sh | sh

echo 'Install tempo-simple'
curl -sS https://raw.github.com/gnugat/tempo-simple/master/bin/installer.sh | sh

if [[ $IS_ROOT = 1 ]]; then
    if [[ ! -f /usr/local/bin/composer ]]; then
        echo 'Install composer'
        curl -sS https://getcomposer.org/installer | php
        mv composer.phar /usr/local/bin/composer
    fi
fi
