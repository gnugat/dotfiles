#!/usr/bin/env bash
# File: /53-sketchybar/config/items/workspaces.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays AeroSpace Workspaces.
##
## Using icons:
## - `\ue795` (nf-fa-terminal)
## - `\uf121` (nf-fa-code)
## - `\uf10b` (nf-fa-mobile_phone)
## - `\uf268` (nf-fa-chrome)
## - `\uf27a` (nf-fa-message)
## - `\uf1bc` (nf-fa-spotify)
## ─────────────────────────────────────────────────────────────────────────────
sketchybar --add event aerospace_workspace_change

_ssdf_ws_icon() {
    case "$1" in
        1) printf "" ;; # Terminal
        2) printf "" ;; # IDE
        4) printf "" ;; # Testing
        5) printf "" ;; # Browser
        6) printf "" ;; # Communication
        7) printf "" ;; # Music
        *) printf "" ;;
    esac
}

for _SSDF_WS_ID in $(aerospace list-workspaces --all); do
    _SSDF_WS_ICON=$(_ssdf_ws_icon "${_SSDF_WS_ID}")

    sketchybar --add item "workspace.${_SSDF_WS_ID}" left
    sketchybar --subscribe "workspace.${_SSDF_WS_ID}" aerospace_workspace_change
    sketchybar --set "workspace.${_SSDF_WS_ID}" \
        background.corner_radius=5 \
        background.height=20 \
        background.color="${_SSDF_CM_SURFACE_0}" \
        label.color="${_SSDF_CM_SUBTEXT_0}" \
        label="${_SSDF_WS_ID}: ${_SSDF_WS_ICON}" \
        script="${CONFIG_DIR}/plugins/workspaces.sh ${_SSDF_WS_ID}"
done
