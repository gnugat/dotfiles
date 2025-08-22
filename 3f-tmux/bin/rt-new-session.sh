#!/usr/bin/env bash
# File: /3f-tmux/bin/rt-new-session.sh
# ──────────────────────────────────────────────────────────────────────────────
# RipTide - Starts new tmux session.
#
# Usage:
#
# ```shell
# rt-new-session.sh <name>
# ```
#
# Options:
#
# * `<name>`: folder / session name
#
# Uses Zoxide to change the current working directory
# and then starts a new tmux session there.
# ──────────────────────────────────────────────────────────────────────────────

_RT_NAME=$1
z $_RT_NAME; tmux new-session -s $_RT_NAME
