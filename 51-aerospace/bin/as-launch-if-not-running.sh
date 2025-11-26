#!/usr/bin/env bash
# File: /51-aerospace/bin/as-launch-if-not-running.sh
# ──────────────────────────────────────────────────────────────────────────────
# AeroSpace - Launch application if not already running.
#
# Usage:
#
# ```shell
# as-launch-if-not-running.sh <app>
# ```
#
# Options:
#
# * `<app>`: application name
#
# Checks if the application is already running using `pgrep`.
# If not found, launches it using `open -a`.
# ──────────────────────────────────────────────────────────────────────────────

_AS_APP="${1}"

if [[ -z "${_AS_APP}" ]]; then
    echo "Error: application name required"
    echo "Usage: as-launch-if-not-running.sh <app>"
    exit 1
fi

pgrep -x "${_AS_APP}" > /dev/null || open -a "${_AS_APP}"
