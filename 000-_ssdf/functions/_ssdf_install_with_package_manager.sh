#!/usr/bin/env bash
# File: /000-_ssdf/functions/_ssdf_install_with_package_manager.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📦 Package management.
## ─────────────────────────────────────────────────────────────────────────────

##
# Runs Package Manager script (eg `./_apt.sh`).
#
# ```bash
# _ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${SSDF_PACKAGE_MANAGER}"
# ```
##
_ssdf_install_with_package_manager() {
    local _ssdf_cwd="$1"
    local _ssdf_package_manager_selected="$2"
    local _ssdf_package_manager_script="${_ssdf_cwd}/_${_ssdf_package_manager_selected}.sh"
    
    if [ -f "${_ssdf_package_manager_script}" ]; then
        bash "${_ssdf_package_manager_script}"
    else
        _ssdf_echo_error "Missing Package Manager script '${_ssdf_package_manager_script}'"
    fi

    unset _ssdf_cwd _ssdf_package_manager_selected _ssdf_package_manager_script
}
