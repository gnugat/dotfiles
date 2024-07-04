#!/usr/bin/env bash

_VIM_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '// Installing vim...'

ln -nsf $_VIM_DOTFILES/config ~/.vimrc

sudo apt install -qqy vim curl
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

unset _VIM_DOTFILES

echo ' '
echo ' [OK] vim installed'
echo ' '
