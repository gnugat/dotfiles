#!/usr/bin/env bash
# File: /3f-tmux/bin/rt-switch-to-session-index.sh
# ──────────────────────────────────────────────────────────────────────────────
# RipTide - Switches tmux session by its index.
#
# Usage:
#
# ```shell
# rt-switch-to-session-index.sh <session_index>
# ```
# ──────────────────────────────────────────────────────────────────────────────

_RT_SESSIONS=$(tmux list-sessions -F "#{session_name}")
_RT_TARGET_INDEX=$1

if [ -z "$_RT_TARGET_INDEX" ]; then
    read -p 'Session index: ' _RT_TARGET_INDEX
fi

_RT_INDEX=1
for _RT_SESSION in $_RT_SESSIONS; do
    if [ $_RT_TARGET_INDEX -eq $_RT_INDEX ]; then
        tmux switch-client -t "${_RT_SESSION}"
        exit 0
    fi

    _RT_INDEX=$(( _RT_INDEX + 1 ))
done

echo "No session found for index $1"
exit 1
