#!/usr/bin/env bash
# File: /53-sketchybar/config/plugins/workspaces.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## ☕ Theme: homemade Catpuccin Machiatto
## ─────────────────────────────────────────────────────────────────────────────
source "${CONFIG_DIR}/themes/catppuccin-macchiato.sh"

## ─────────────────────────────────────────────────────────────────────────────
## If the AeroSpace Workspace is the one in focus, then highlight it.
## ─────────────────────────────────────────────────────────────────────────────
_SSDF_WS_ID=$1
_SSDF_WS_FOCUSED="${FOCUSED_WORKSPACE}"
if [[ -z "${_SSDF_WS_FOCUSED}" ]]; then
    _SSDF_WS_FOCUSED=$(aerospace list-workspaces --focused)
fi

if [ "${_SSDF_WS_ID}" = "${_SSDF_WS_FOCUSED}" ]; then
    sketchybar --set $NAME \
        label.color="${_SSDF_CM_MAUVE}" \
        background.color="${_SSDF_CM_SURFACE_2}"
else
    sketchybar --set $NAME background.drawing=off \
        label.color="${_SSDF_CM_SUBTEXT_0}" \
        background.color="${_SSDF_CM_SURFACE_0}"
fi
