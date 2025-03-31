#!/usr/bin/env bash
# File: /53-sketchybar/config/plugins/slack.sh
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Displays numbder of Slack direct unread notifications.
## ─────────────────────────────────────────────────────────────────────────────
_SSDF_SB_SLACK_STATUS_LABEL=$(lsappinfo info -only StatusLabel Slack | sed -n 's/.*"label"="\(.*\)".*/\1/p')

                                                                           # ↓ Using envvar ($_SSDF_CM_RED) doesn't work there :/
sketchybar --set "$NAME" label="${_SSDF_SB_SLACK_STATUS_LABEL}" label.color="0xfff38ba8"
