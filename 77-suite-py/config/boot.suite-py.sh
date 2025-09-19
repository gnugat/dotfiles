#!/usr/bin/env bash
# File: /77-suite-py/config/boot.suite-py.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👢🥧 BOOT management, for suite-py.
# ──────────────────────────────────────────────────────────────────────────────

if which suite-py > /dev/null; then
    eval "$(_SUITE_PY_COMPLETE=source_zsh suite-py)"
fi