#!/usr/bin/env bash
# File: /320-claude/config/statusline-command.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📊✳ Claude Code status line command.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📤 Output:
## 
## Sonnet 4.6 | Context: 23% | Session: 42% (reset: 13:37) | Weekly: 65% (reset: Mon 10:00)
##
## ─────────────────────────────────────────────────────────────────────────────
_INPUT=$(cat)

## ─────────────────────────────────────────────────────────────────────────────
## Model
## ─────────────────────────────────────────────────────────────────────────────
_MODEL=$(echo "${_INPUT}" | jq -r '.model.display_name')
_OUTPUT="${_MODEL}"

## ─────────────────────────────────────────────────────────────────────────────
## Context used, percentage
## ─────────────────────────────────────────────────────────────────────────────
_CONTEXT_USED=$(echo "${_INPUT}" | jq -r '.context_window.used_percentage // empty')
if [ -n "${_CONTEXT_USED}" ]; then
  _OUTPUT="${_OUTPUT} | Context: $(printf '%.0f' "${_CONTEXT_USED}")%"
fi

## ─────────────────────────────────────────────────────────────────────────────
## Current Session (blocks of 5 hours) used, percentage.
## With next reset time.
## ─────────────────────────────────────────────────────────────────────────────

fmt_time() {
  date -r "$1" "+%H:%M" 2>/dev/null
}

_CURRENT_SESSION_USED=$(echo "${_INPUT}" | jq -r '.rate_limits.five_hour.used_percentage // empty')
_CURRENT_SESSION_RESET=$(echo "${_INPUT}" | jq -r '.rate_limits.five_hour.resets_at // empty')
if [ -n "${_CURRENT_SESSION_USED}" ]; then
  _OUTPUT="${_OUTPUT} | Session: $(printf '%.0f' "${_CURRENT_SESSION_USED}")%"
  if [ -n "${_CURRENT_SESSION_RESET}" ]; then
    _OUTPUT="${_OUTPUT} (reset: $(fmt_time "${_CURRENT_SESSION_RESET}"))"
  fi
fi

## ─────────────────────────────────────────────────────────────────────────────
## Weekly Session used, percentage.
## With next reset time (Mon 10:00).
## ─────────────────────────────────────────────────────────────────────────────

fmt_day_time() {
  date -r "$1" "+%a %H:%M" 2>/dev/null
}

_WEEKLY_SESSION_USED=$(echo "${_INPUT}" | jq -r '.rate_limits.seven_day.used_percentage // empty')
_WEEKLY_SESSION_RESET=$(echo "${_INPUT}" | jq -r '.rate_limits.seven_day.resets_at // empty')
if [ -n "${_WEEKLY_SESSION_USED}" ]; then
  _OUTPUT="${_OUTPUT} | Weekly: $(printf '%.0f' "${_WEEKLY_SESSION_USED}")%"
  if [ -n "${_WEEKLY_SESSION_RESET}" ]; then
    _OUTPUT="${_OUTPUT} (reset: $(fmt_day_time "${_WEEKLY_SESSION_RESET}"))"
  fi
fi

## ─────────────────────────────────────────────────────────────────────────────
## Display final status line
## ─────────────────────────────────────────────────────────────────────────────

echo "${_OUTPUT}"
