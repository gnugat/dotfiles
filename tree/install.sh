#!/usr/bin/env bash

_TREE_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '// Installing tree...'

sudo apt install -qqy tree

unset _TREE_DOTFILES

echo ' '
echo ' [OK] tree installed'
echo ' '
