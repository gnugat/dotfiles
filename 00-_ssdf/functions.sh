#!/usr/bin/env bash
# File: /00-_ssdf/functions.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_FUNCTIONS_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")" && pwd -P)"

## ─────────────────────────────────────────────────────────────────────────────
## ➕ Include all functions.
## ─────────────────────────────────────────────────────────────────────────────

for _SSDF_FUNCTION_SCRIPT in ${_SSDF_FUNCTIONS_DIR}/functions/*.sh; do
    source "${_SSDF_FUNCTION_SCRIPT}"
done

unset _SSDF_FUNCTIONS_DIR \
    _SSDF_FUNCTION_SCRIPT
