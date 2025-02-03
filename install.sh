#!/usr/bin/env bash

_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

#for _apt in $_DOTFILES/*/_apt.sh; do
#  bash "$_apt" -H || break
#done
sudo apt -qq update

for install in $_DOTFILES/*/install.sh; do
  bash "$install" -H || break
done

unset _DOTFILES
