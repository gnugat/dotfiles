#!/usr/bin/env bash
# File: /3c-eza/config/aliases.eza.sh
# ──────────────────────────────────────────────────────────────────────────────
# 😎📋 ALIAS management, for eza.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📃 Listing.
##
## NOTE: eza's built-in sorting is lexicographic (sorts `3a-*` before `30-*`).
## We have to pipe `eza` to `sort -n` to instead have numeric ordering.
## To make sure the directories are displayed before the files,
## even when the icon is displayed (`sort` won't ignore the UTF-8 character),
## we split the command in two.
## ─────────────────────────────────────────────────────────────────────────────

# Remove any existing aliases
unalias l la ll lla 2>/dev/null || true

l() {
    eza --color=always --tree --level=0 --icons=always --only-dirs "$@" | sort -n
    eza --color=always --tree --level=0 --icons=always --only-files "$@" | sort -n
}

la() {
    l --all
}

ll() {
    l --long --group --git
}

lla() {
    l --all --long --group --git
}

