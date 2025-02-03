#!/usr/bin/env bash

_CURL_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '// Installing curl...'

sudo apt -qqy install curl

unset _CURL_DOTFILES

echo ' '
echo ' [OK] curl installed'
echo ' '
