#!/usr/bin/env bash
# File: /3c-fzf/config/envvars.fzf.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️ 🌸 ENVVAR management, for fzf.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🌈 Theme.
## ─────────────────────────────────────────────────────────────────────────────

export FZF_DEFAULT_OPTS=" \
    --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
    --color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
    --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
    --color=selected-bg:#494d64 \
    --color=border:#363a4f,label:#cad3f5"

## ─────────────────────────────────────────────────────────────────────────────
## 🔎 Replacing `find` with `fd`.
## ─────────────────────────────────────────────────────────────────────────────

## For the keybindings** completion, when looking for files and directories
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

## For the ** completion, when looking for files and directories
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

## For the ** completion, when looking for directories
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}
