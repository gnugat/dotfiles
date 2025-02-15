#!/usr/bin/env bash
# File: /00-_ssdf/functions/_ssdf_select_package_manager.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Package management.
## ─────────────────────────────────────────────────────────────────────────────

##
# Selects Package Manager, ensures `_SSDF_PACKAGE_MANAGER` is set.
#
# ```bash
# _ssdf_select_package_manager
# ```
##
_ssdf_select_package_manager() {
    for _ssdf_supported_package_manager in \
        "apt" \
        "brew" 
    do
        if command -v "${_ssdf_supported_package_manager}" >/dev/null 2>&1; then
            _SSDF_PACKAGE_MANAGER="${_ssdf_supported_package_manager}"
            return
        fi
    done

    _ssdf_echo_error "Current Package Manager not part of supported ones (${_ssdf_supported_package_managers})."
}
