#!/usr/bin/env bash
# File: /3d-fzf/config/envvars.fzf.sh
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

## For the keybindings completion, when looking for files and directories
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="${FZF_DEFAULT_COMMAND}"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

## For the ** completions
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}
_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

## ─────────────────────────────────────────────────────────────────────────────
## 📋🦇 Previews, using eza (for lists) and bat (for single files).
## ─────────────────────────────────────────────────────────────────────────────

## For the keybindings completion, when looking for files and directories
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always --line-range :200 {}'"

## For the ** completions
_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd) fzf --preview 'eza --tree --color=always {} | head -n 200' "$@" ;;
        export|unset) fzf --preview "eval 'echo \$' {}" "$@" ;;
        ssh) fzf --preview 'dig {}' "$@" ;;
        *) fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" "$@" ;;
    esac
}
