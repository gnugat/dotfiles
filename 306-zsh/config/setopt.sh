#!/usr/bin/env bash
# File: /306-zsh/config/setopt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 👓 zsh shell options.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## Allow comments (`#`) in the shell. 
## ─────────────────────────────────────────────────────────────────────────────
setopt interactivecomments

## ─────────────────────────────────────────────────────────────────────────────
## 🏺 Unified history:
## + share history between shells/terms/sessions, by:
##     + writing command to history as soon as it's entered
##     + reading history before displaying prompt (as opposed to before starting)
##
## 🏺ℹ️ Notes:
##  - SHARE_HISTORY supersedes (and is mutually exclusive to):
##     - APPEND_HISTORY (*sessions* append to history, instead of replacing it)
##     - INC_APPEND_HISTORY (like APPEND_HISTORY, but incrementally,
##       on each command, instead on shell termination)
##     - INC_APPEND_HISTORY_TIME (like INC_APPEND_HISTORY,
##       but in EXTENDED_HISTORY format)
## See: https://zsh.sourceforge.io/Doc/Release/Options.html#History
## ─────────────────────────────────────────────────────────────────────────────
setopt SHARE_HISTORY

### ─────────────────────────────────────────────────────────────────────────────
### 🏺🙈 Duplicates (and space) management:
### - remove duplicates from history first, when history is full.
### - do not display duplicates when searching history
### - do not add to history duplicates
### - do not add to history lines starting with space (use cases: test, privacy)
### ─────────────────────────────────────────────────────────────────────────────
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

### ─────────────────────────────────────────────────────────────────────────────
### 🏺🔎 Show command with history expansion to use before running it.
### ─────────────────────────────────────────────────────────────────────────────
setopt HIST_VERIFY

### ─────────────────────────────────────────────────────────────────────────────
### 🏺⬆️ When typing a command, use up/down arrows to go through their specific history
### For example: `git ` then ⬆️ , instead of getting `ls`, we get `git status`.
### ─────────────────────────────────────────────────────────────────────────────
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

## ─────────────────────────────────────────────────────────────────────────────
## ✅ Completions.
## ─────────────────────────────────────────────────────────────────────────────
if [ -e /opt/homebrew/share/zsh/site-functions ]; then
    fpath=(
        /opt/homebrew/share/zsh/site-functions
        $fpath
    )
elif [ -e /usr/share/zsh/site-functions ]; then
    fpath=(
        /usr/share/zsh/site-functions
        /usr/share/zsh/vendor-completions
        $fpath
    )
fi
autoload -Uz compinit
compinit

## ─────────────────────────────────────────────────────────────────────────────
## 🚗 Auto-suggestions.
## ─────────────────────────────────────────────────────────────────────────────
if [ -e /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
elif [ -e /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🌈 Syntax Highlighting.
## ─────────────────────────────────────────────────────────────────────────────
if [ -e /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [ -e /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

## ─────────────────────────────────────────────────────────────────────────────
## 😈 Evil (emacs) keybindings.
## ─────────────────────────────────────────────────────────────────────────────
set -o emacs
