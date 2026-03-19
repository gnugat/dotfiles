#!/usr/bin/env bash
# File: /709-rust/config/path.rust.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🧭🦀 PATH management, for rust.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PATH_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PATH_DIR}/../..")"
source "${SSDF_ROOT_DIR}/000-_ssdf/functions/_ssdf_prepend_path.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 🦀 Cargo bin directory.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "${HOME}/.cargo/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PATH_DIR