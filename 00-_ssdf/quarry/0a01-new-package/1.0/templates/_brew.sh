#!/usr/bin/env bash
# File: /{{ _SSDF_INPUT_PACKAGE_ID }}-{{ _SSDF_INPUT_PACKAGE_NAME }}/_brew.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍏{{ _SSDF_INPUT_PACKAGE_EMOJI }} Installing {{ _SSDF_INPUT_PACKAGE_NAME }}, on Mac OS (brew).
# ──────────────────────────────────────────────────────────────────────────────

HOMEBREW_NO_ENV_HINTS=1 brew install -q {{ _SSDF_INPUT_PACKAGE_NAME }}
