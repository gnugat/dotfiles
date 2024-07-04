#!/usr/bin/env bash

_ACK_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '// Installing ack...'

sudo apt install -qqy ack-grep
ln -nsf $_ACK_DOTFILES/config ~/.ackrc

unset _ACK_DOTFILES

echo ' '
echo ' [OK] ack installed'
echo ' '
