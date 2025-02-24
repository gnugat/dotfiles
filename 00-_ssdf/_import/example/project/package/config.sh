#!/usr/bin/env bash
# File: /tmp/project/package/config.sh

echo ''
echo '/tmp/project/package/config.sh'
echo "£0:              $0"
echo "£BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
echo "realpath("
echo "    £BASH_SOURCE[0]"
echo "):               $(realpath "${BASH_SOURCE[0]}")"
