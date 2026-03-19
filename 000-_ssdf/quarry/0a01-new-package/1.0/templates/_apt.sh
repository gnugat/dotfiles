#!/usr/bin/env bash
# File: /{{ _SSDF_INPUT_PACKAGE_ID }}-{{ _SSDF_INPUT_PACKAGE_NAME }}/_apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍊{{ _SSDF_INPUT_PACKAGE_EMOJI }} Installing {{ _SSDF_INPUT_PACKAGE_NAME }}, on Ubuntu (apt).
# ──────────────────────────────────────────────────────────────────────────────

sudo apt-get -qqy install {{ _SSDF_INPUT_PACKAGE_NAME }}
