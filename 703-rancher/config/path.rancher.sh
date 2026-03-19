#!/usr/bin/env bash
# File: /703-rancher/config/path.rancher.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🧭🤠 PATH management, for rancher.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PATH_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PATH_DIR}/../..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions/_ssdf_prepend_path.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🤠 Rancher Desktop.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "${HOME}/.rd/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PATH_DIR