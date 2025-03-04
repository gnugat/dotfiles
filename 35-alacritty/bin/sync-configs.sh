#!/usr/bin/env bash
# File: /35-alacritty/bin/sync-configs.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔺 Alacritty
#
# Backward compatibility break in v0.14:
# * `import` config got moved to `general` new section
#
# This script:
# * copies the `alacritty.toml` file to `alacritty.old.toml`
# * removes the `[general]` section
#
# This allows us to maintain only one config file, and keep BC.
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PACKAGE_BIN_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
_SSDF_PACKAGE_CONFIG_DIR="$(realpath "${_SSDF_PACKAGE_BIN_DIR}/../config")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_BIN_DIR}/../../")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"

_ssdf_echo_section_title "Synchronising Alacritty configurations..."

cp -i \
    "${_SSDF_PACKAGE_CONFIG_DIR}/alacritty.toml" \
    "${_SSDF_PACKAGE_CONFIG_DIR}/alacritty.old.toml"

## Make GNU and BSD sed cross platform
if [ "$(uname)" = "Darwin" ]; then
    _SSDF_SED_IN_PLACE=(-i "") # BSD sed (eg Mac OS)
else
    _SSDF_SED_IN_PLACE=(-i) # GNU sed (eg Ubuntu)
fi

sed "${_SSDF_SED_IN_PLACE[@]}" \
    -e "/^\[general\]$/d" \
    "${_SSDF_PACKAGE_CONFIG_DIR}/alacritty.old.toml"

_ssdf_echo_success "Alacritty configurations synchronised"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

_ssdf_unset_envvars
