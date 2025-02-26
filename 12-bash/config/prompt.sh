#!/usr/bin/env bash
# File: /12-bash/config/prompt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🎤️ Bash minimalist, yet elegant, prompt:
# 1. current working directory; in blue, truncated when too long 
# 2. git branch (if any); in yellow, with status
# 3. prompt; in green if last command was successful, red otherwise
#
# ```shell
# ~/working/path:git-branch *%>
# ```
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🎨 Colours (none, red, green, yellow, blue).
## ─────────────────────────────────────────────────────────────────────────────
_CN="\[\e[0m\]"
_CR="\[\e[31m\]"
_CG="\[\e[32m\]"
_CY="\[\e[33m\]"
_CB="\[\e[34m\]"

## ─────────────────────────────────────────────────────────────────────────────
## 📁 Current working directory.
## Truncates it if it's more than 3rd of the number of COLUMNS.
## _Note_: If COLUMNS isn't set, default to 20.
## ─────────────────────────────────────────────────────────────────────────────
function _set_working_dir() {
    _WORKING_DIR=$(dirs +0)
    local pwdmaxlen=$((${COLUMNS:-20}/3))
    if [ ${#_WORKING_DIR} -gt $pwdmaxlen ] ; then
        _WORKING_DIR="…${_WORKING_DIR: -$pwdmaxlen}";
    fi
    _WORKING_DIR="${_CB}${_WORKING_DIR}${_CN}"
    unset pwdmaxlen
}

## ─────────────────────────────────────────────────────────────────────────────
## 🐙 If in git project, display branch name and status.
## ─────────────────────────────────────────────────────────────────────────────
if command -v git >/dev/null 2>&1; then
    export GIT_PS1_SHOWDIRTYSTATE=true # adds unstaged (*) and staged (+)
    export GIT_PS1_SHOWUNTRACKEDFILES=true # adds untracked (%)

    # Loads __git_ps1 bash completion from git, if its git-prompt script exists
    if [ -e /etc/bash_completion.d/git-prompt ]; then
        source /etc/bash_completion.d/git-prompt
    elif [ -e /usr/share/git/completion/git-prompt.sh ]; then
        source /usr/share/git/completion/git-prompt.sh
    elif [ -e /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
        source /usr/local/etc/bash_completion.d/git-prompt.sh
    fi

    # Define _GIT_INFO only if __git_ps1 is available
    if declare -F __git_ps1 >/dev/null; then
        _GIT_INFO=$_CY'$(__git_ps1 ":%s")'$_CN
    fi
fi

## ─────────────────────────────────────────────────────────────────────────────
## 🚦 Depending on last command success, colours > in green or red.
## ─────────────────────────────────────────────────────────────────────────────
function _set_exit_info() {
    if [[ $? != "0" ]]; then
        _EXIT_INFO=$_CR\>$_CN;
    else
        _EXIT_INFO=$_CG\>$_CN;
    fi
}

PROMPT_COMMAND='_set_exit_info;_set_working_dir;PS1="$_WORKING_DIR$_GIT_INFO$_EXIT_INFO "'
