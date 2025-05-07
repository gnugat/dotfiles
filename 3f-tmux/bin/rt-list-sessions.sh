#!/usr/bin/env bash
# File: /3f-tmux/bin/rt-list-sessions.sh
# ──────────────────────────────────────────────────────────────────────────────
# RipTide - Lists tmux sessions.
#
# Usage:
#
# ```shell
# rt-list-sessions.sh -S
# ```
#
# Options:
#
# * `-S`: status line format
#
# Session names are listed one per line:
#
# ```
# first-session
# second-session
# ```
#
# Note that the last session name isn't followed by a new line.
#
# If the `-S` option is used, then sessions are listed on a single line:
#
# ```
# <session1> <session2>
# ```
#
# Each name will also be formated for the status line as follow:
# 
# `<style>[<session_index>:<session_name><flag>]`
#
# With flag being:
# + `*`: current session
# + `-`: last active session
# ──────────────────────────────────────────────────────────────────────────────

_RT_CURRENT_SESSION=$(tmux display-message -p "#{session_name}")
_RT_LAST_SESSION=$(tmux display-message -p "#{client_last_session}")
_RT_SESSIONS=$(tmux list-sessions -F "#{session_name}")

if [ "-S" != "$1" ]; then
    printf "${_RT_SESSIONS}"

    exit 0
fi

_RT_CLEAR="#[fg=#{@thm_subtext_1}, bg=#{@thm_mantle}]"
_RT_SESSION_LIST=""
_RT_INDEX=1
for _RT_SESSION in $_RT_SESSIONS; do
    _RT_STYLE="#[fg=#{@thm_subtext_0}, bg=#{@thm_surface_0}"
    _RT_FLAG=""
    if [ "$_RT_SESSION" = "$_RT_CURRENT_SESSION" ]; then
        _RT_STYLE="#[fg=#{@thm_mauve}, bg=#{@thm_surface_2}]"
        _RT_FLAG="*"
    elif [ "$_RT_SESSION" = "$_RT_LAST_SESSION" ]; then
        _RT_STYLE="#[fg=#{@thm_blue}, bg=#{@thm_surface_1}]"
        _RT_FLAG="-"
    fi
    _RT_SESSION_ITEM="${_RT_STYLE}[${_RT_INDEX}:${_RT_SESSION}${_RT_FLAG}]${_RT_CLEAR}"

    _RT_SESSION_LIST="${_RT_SESSION_LIST} ${_RT_SESSION_ITEM}"

    _RT_INDEX=$(( _RT_INDEX + 1 ))
done

printf "${_RT_SESSION_LIST}"
