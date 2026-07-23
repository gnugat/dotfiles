#!/usr/bin/env bash
# File: /324-phpactor/_apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍊🅿️ Installing phpactor, on Ubuntu (apt).
# Actually, there's no apt package for it, so doing it manually with curl.
#
# Also installs inotify: instead of re-scanning periodically using `find`,
# for changes in files (even when nothing changed),
# `inotify` gets notified by Linux when files actually change.
# ──────────────────────────────────────────────────────────────────────────────

sudo apt-get -qqy install inotify-tools

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"

source "${_SSDF_PACKAGE_DIR}/__curl.sh"
