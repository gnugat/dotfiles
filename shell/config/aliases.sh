#!/usr/bin/env bash
# File: /shell/config/alias.sh
# ──────────────────────────────────────────────────────────────────────────────
# 😎 ALIAS management.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 👮 Allows to use `sudo` with aliases.
## ─────────────────────────────────────────────────────────────────────────────
alias sudo="sudo "

## ─────────────────────────────────────────────────────────────────────────────
## 🎨 Enables colour support.
## ─────────────────────────────────────────────────────────────────────────────
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=always'
fi

## ─────────────────────────────────────────────────────────────────────────────
## 📃 Listing.
## ─────────────────────────────────────────────────────────────────────────────
alias la='ls -A'
alias ll='ls -lF'
alias lla='ls -alF'
alias l='ls -CF'

## ─────────────────────────────────────────────────────────────────────────────
## ✏️  Editor.
## ─────────────────────────────────────────────────────────────────────────────
alias sed="sed --follow-symlinks"
alias grep='
grep --exclude "*.lock" \
     --exclude "*.cache" \
     --exclude-dir "vendor" \
     --exclude-dir "var" \
     --exclude-dir ".git" \
     --color=always'

## ─────────────────────────────────────────────────────────────────────────────
## 💬 Interractive mode.
## ─────────────────────────────────────────────────────────────────────────────
alias cp="cp -i"
alias mv="mv -i"

## ─────────────────────────────────────────────────────────────────────────────
## 🧽 Cleaning.
## ─────────────────────────────────────────────────────────────────────────────
alias clean="find . -type f \( -name '*~' -o -name '*.swp' -o -name '*.bak' \) -print -delete"
alias reset='
source ~/.profile
/usr/bin/reset
/usr/bin/clear'
