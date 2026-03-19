#!/usr/bin/env bash
# File: /706-python/config/path.python.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🧭🐍 PATH management, for python.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PATH_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PATH_DIR}/../..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions/_ssdf_prepend_path.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🐍 Python 3.13 from Homebrew.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "/opt/homebrew/opt/python@3.13/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🐍 Python 3.13 user bin directory.
## ─────────────────────────────────────────────────────────────────────────────
PYTHON_USER_BASE="$(python3.13 -m site --user-base 2>/dev/null || echo "$HOME/.local")"
_ssdf_prepend_path "${PYTHON_USER_BASE}/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PATH_DIR
unset PYTHON_USER_BASE