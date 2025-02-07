#!/usr/bin/env bash

###
# Super Secret Dot Files functions
###

##
# Display section title.
#
# ```bash
# _ssdf_echo_section_title "Installing ${PACKAGE_NAME}"
# ```
##
_ssdf_echo_section_title() {
    local _ssdf_message="$1"
    echo "// ${_ssdf_message}"
    echo " "
}

##
# Display error message.
#
# ```bash
# _ssdf_echo_error "Current Package Manager not part of supported ones (apt)."
# ```
##
_ssdf_echo_error() {
    local _ssdf_message="$1"
    echo " "
    echo " [ERROR] ${_ssdf_message}" >&2
    echo " "
    exit 1
}

##
# Display success message.
#
# ```bash
# _ssdf_echo_success "${PACKAGE_NAME} installed"
# ```
##
_ssdf_echo_success() {
    local _ssdf_message="$1"
    echo " "
    echo " [OK] ${_ssdf_message}"
    echo " "
}

##
# Select Package Manager, ensures `_SSDF_PACKAGE_MANAGER` is set.
#
# ```bash
# _ssdf_select_package_manager
# ```
##
_ssdf_select_package_manager() {
    if [ -z "${_SSDF_PACKAGE_MANAGER}" ]; then
        if command -v apt >/dev/null 2>&1; then
            _SSDF_PACKAGE_MANAGER="apt"
        elif command -v brew >/dev/null 2>&1; then
            _SSDF_PACKAGE_MANAGER="brew"
        else
            _ssdf_echo_error "Current Package Manager not part of supported ones (apt, brew)."
        fi
    fi
}

##
# Runs Package Manager script (eg `./_apt.sh`).
#
# ```bash
# _ssdf_install_with_package_manager "${_SSDF_PACKAGE_DIR}" "${_SSDF_PACKAGE_MANAGER}"
# ```
##
_ssdf_install_with_package_manager() {
    local _ssdf_cwd="$1"
    local _ssdf_package_manager="$2"
    local _ssdf_package_manager_script="${_ssdf_cwd}/_${_ssdf_package_manager}.sh"
    
    if [ -f "${_ssdf_package_manager_script}" ]; then
        bash "${_ssdf_package_manager_script}"
    else
        _ssdf_echo_error "Missing Package Manager script '${_ssdf_package_manager_script}'"
    fi
}
