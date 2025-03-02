#!/usr/bin/env bash
# File: /36-zsh/config/setopt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👓 zsh shell options.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏺 Share history between terms by:
## - writing command to history as soon as it's entered
## - reading history before displaying prompt (as opposed to before starting)
## ─────────────────────────────────────────────────────────────────────────────
setopt share_history

### ─────────────────────────────────────────────────────────────────────────────
### 🏺👴 Remove duplicates from history first, when HISTFILESIZE is exceeded.
### ─────────────────────────────────────────────────────────────────────────────
setopt hist_expire_dups_first

### ────────────────────────────────────────────────────────────────────────────
### 🏺🙈 Ignores:
### - lines starting with a space (to allow privacy)
### - duplicates
### ────────────────────────────────────────────────────────────────────────────
setopt hist_ignore_space
setopt hist_ignore_dups

### ─────────────────────────────────────────────────────────────────────────────
### 🏺🔎 Show command with history expansion to use before running it.
### ─────────────────────────────────────────────────────────────────────────────
setopt hist_verify

### ─────────────────────────────────────────────────────────────────────────────
### 🏺⬆️ When typing a command, use up/down arrows to go through their specific history
### For example: `git ` then ⬆️ , instead of getting `ls`, we get `git status`.
### ─────────────────────────────────────────────────────────────────────────────
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

## ─────────────────────────────────────────────────────────────────────────────
## 🚗 Autosuggestions
## ─────────────────────────────────────────────────────────────────────────────
if [ -e /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
