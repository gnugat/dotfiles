#!/usr/bin/env bash
# File: /_ssdf_func.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🔭 Super Secret Dot Files functions.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📰 Display helpers.
## ─────────────────────────────────────────────────────────────────────────────

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

## ─────────────────────────────────────────────────────────────────────────────
## 📃 File manipulation.
## ─────────────────────────────────────────────────────────────────────────────

##
# Attempts to create `file` if it doesn't exist.
#
# ```bash
# _ssdf_ensure_file_is_created "${HOME}/.config/shell/envvars.local.sh"
# ```
##
_ssdf_ensure_file_is_created() {
    local file="$1"
    if [ ! -e "${file}" ]; then
        touch "${file}"
    fi
}

_ssdf_append_empty_line() {
    local file="$1"
    if [ -s "${file}" ] && [ "$(tail -n 1 "${file}")" != "" ]; then
        echo '' >> "${file}"
    fi
}

## ─────────────────────────────────────────────────────────────────────────────
## 🐚 Shell (environment variables, paths).
## ─────────────────────────────────────────────────────────────────────────────

##
# Appends to `env_file` the `env_variable` with `env_value`.
#
# _Notes_:
# * attempts to create the file if it didn't exist
# * only appends if the `export` statement wasn't already in the file
#
# ```bash
# _ssdf_append_envvar "${_SSDF_SHELL_ENVVARS}" "ACKRC" "${HOME}/.config/ack/ackrc"
# ```
##
_ssdf_append_envvar() {
    local env_file="$1"
    local env_variable="$2"
    local env_value="$3"
    _ssdf_ensure_file_is_created "${env_file}"
    if ! $(grep -q "^export ${env_variable}=" "${env_file}"); then
        echo "export ${env_variable}=\"${env_value}\"" >> "${env_file}"
    fi
}

##
# Appends to `script_file` the given `source_line`.
#
# _Notes_:
# * attempts to create the file if it didn't exist
# * only appends if the `source_line` statement wasn't already in the file
# * appends an empty line before appending the source line
#
# ```bash
# _ssdf_append_source "~/.config/shell/aliases.local.sh" "source ${HOME}/.config/less/envvars.less.sh"
# ```
##
_ssdf_append_source() {
    local script_file="$1"
    local source_line="$2"
    _ssdf_ensure_file_is_created "${script_file}"
    if ! $(grep -qxF "${source_line}" "${script_file}"); then
        _ssdf_append_empty_line "${script_file}"
        echo "${source_line}" >> "${script_file}"
    fi
}

##
# Prepends dir to PATH, if it exists and wasn't already added.
#
# ```bash
# _ssdf_prepend_path "${HOME}/bin" "${HOME}/.local/bin"
# ```
##
_ssdf_prepend_path() {
    for dir in "$@"; do
        if [ -d "${dir}" ] && [[ ":${PATH}:" != *":${dir}:"* ]]; then
            export PATH="${dir}:${PATH}"
        fi
    done
}
