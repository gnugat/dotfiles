#!/usr/bin/env bash
# File: /00-_ssdf/functions.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_FUNCTION_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Include all functions.
## ─────────────────────────────────────────────────────────────────────────────

for _SSDF_FUNCTION_SCRIPT in ${_SSDF_FUNCTION_DIR}/functions/*.sh; do
    source "${_SSDF_FUNCTION_SCRIPT}"
done

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
