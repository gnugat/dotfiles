#!/usr/bin/env bash
# File: /11-bash/config/shopt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👓 Bash shell options.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏁 Autocompletes with sudo.
## ─────────────────────────────────────────────────────────────────────────────
complete -cf sudo

## ─────────────────────────────────────────────────────────────────────────────
## 💫 Fixes typos in the `cd` command.
## ─────────────────────────────────────────────────────────────────────────────
shopt -s cdspell # Fix cd typos

## ─────────────────────────────────────────────────────────────────────────────
## 🏺 Logs multi-line commands.
## ─────────────────────────────────────────────────────────────────────────────
shopt -s cmdhist

## ─────────────────────────────────────────────────────────────────────────────
## 🎭 Replaces aliases with their commands.
## ─────────────────────────────────────────────────────────────────────────────
shopt -s expand_aliases

## ─────────────────────────────────────────────────────────────────────────────
## 😑 Case insensitive.
## ─────────────────────────────────────────────────────────────────────────────
shopt -s nocaseglob # Case insensitive
