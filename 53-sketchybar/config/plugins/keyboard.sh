#!/usr/bin/env bash
# File: /53-sketchybar/config/plugins/keyboard.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays the Keyboard Layout Input Source.
## ─────────────────────────────────────────────────────────────────────────────
_SSDF_SB_INPUT_SOURCE=$(defaults read com.apple.HIToolbox AppleCurrentKeyboardLayoutInputSourceID)
case "${_SSDF_SB_INPUT_SOURCE}" in
  "com.apple.keylayout.ABC-AZERTY") _SSDF_SB_KEYBOARD_LAYOUT="AZ"
  ;;
  "com.apple.keylayout.British") _SSDF_SB_KEYBOARD_LAYOUT="GB"
  ;;
  *) _SSDF_SB_KEYBOARD_LAYOUT="AZ"
esac

sketchybar --set "$NAME" label="${_SSDF_SB_KEYBOARD_LAYOUT}"
