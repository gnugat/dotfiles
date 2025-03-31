#!/usr/bin/env bash
# File: /53-sketchybar/config/plugins/battery.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays the battery charge.
##
## Using icons:
## * `\uf240` nf-fa-battery_4 (full) 
## * `\uf241` nf-fa-battery_3 (high) 
## * `\uf242` nf-fa-battery_2 (half) 
## * `\uf243` nf-fa-battery_1 (low) 
## * `\uf244` nf-fa-battery_0 (empty) 
## * `\uf0e7` nf-fa-bolt (charging)
## ─────────────────────────────────────────────────────────────────────────────
_SSDF_SB_PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
_SSDF_SB_CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "" = "${_SSDF_SB_PERCENTAGE}" ]; then
  exit 0
fi

case "${_SSDF_SB_PERCENTAGE}" in
  9[0-9]|100) ICON=""
  ;;
  [6-8][0-9]) ICON=""
  ;;
  [3-5][0-9]) ICON=""
  ;;
  [1-2][0-9]) ICON=""
  ;;
  *) ICON=""
esac

if [[ "" != "${_SSDF_SB_CHARGING}" ]]; then
  ICON=""
fi

sketchybar --set "$NAME" icon="$ICON" label="${_SSDF_SB_PERCENTAGE}%"
