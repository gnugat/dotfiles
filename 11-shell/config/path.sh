#!/usr/bin/env bash
# File: /11-shell/config/path.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🧭 PATH management.
#
# _Notes_:
# * path is only added if it exists
# * path is only added if it wasn't already included
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_PATH_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PATH_DIR}/../..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions/_ssdf_prepend_path.sh"

## ─────────────────────────────────────────────────────────────────────────────
## 👢 System wide, small, early boot stage (before `/usr` mount).
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "/bin" "/sbin"

## ─────────────────────────────────────────────────────────────────────────────
## ⚙️  System wide, handled by distribution's package manager.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "/usr/bin" "/usr/sbin"

## ─────────────────────────────────────────────────────────────────────────────
## 📂 System wide, compiled by administrator (eg using `make`).
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "/usr/local/bin" "/usr/local/sbin"

## ─────────────────────────────────────────────────────────────────────────────
## 🫰 Snap (eg 👥 Ms Teams).
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "/snap/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🍺 Homebrew (🍎 Apple Chip, 🐧 Linux).
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "/opt/homebrew/bin"
_ssdf_prepend_path "${HOME}/.linuxbrew/bin"

## ─────────────────────────────────────────────────────────────────────────────
## ❄️  Nix.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "${HOME}/.nix-profile/bin"
_ssdf_prepend_path "/nix/var/nix/profiles/default/bin"
_ssdf_prepend_path "/etc/profiles/per-user/${USER}/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🏠 User.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "${HOME}/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🔭 Super Secret Dot Files scripts.
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "${SSDF_ROOT_DIR}/00-_ssdf/bin"
_ssdf_prepend_path "${SSDF_ROOT_DIR}/3f-tmux/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🐍 Python (eg Ansible).
## ─────────────────────────────────────────────────────────────────────────────
_ssdf_prepend_path "${HOME}/.local/bin"

## ─────────────────────────────────────────────────────────────────────────────
## 🧹 Cleaning up local variables
## ─────────────────────────────────────────────────────────────────────────────

unset _SSDF_PATH_DIR
