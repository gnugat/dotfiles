#!/usr/bin/env bash

# Colors: None, Red, Green, Yellow, Blue
_CN="\[\e[0m\]"
_CR="\[\e[31m\]"
_CG="\[\e[32m\]"
_CY="\[\e[33m\]"
_CB="\[\e[34m\]"

# displays git information
if [[ `which git` ]]; then
    export GIT_PS1_SHOWDIRTYSTATE=true # adds unstaged (*) and staged (+)
    export GIT_PS1_SHOWUNTRACKEDFILES=true # adds untracked (%)

    source /etc/bash_completion.d/git-prompt # loads __git_ps1 bash completion from git

    _GIT_INFO=$_CY'$(__git_ps1 ":%s")'$_CN
fi

# Depending on last command success, colors > in green or red
function _set_exit_info() {
    if [[ $? != "0" ]]; then
        _EXIT_INFO=$_CR\>$_CN;
    else
        _EXIT_INFO=$_CG\>$_CN;
    fi
}

# Working directory truncated when too long
function _set_working_dir() {
    _WORKING_DIR=$(dirs +0)
    local pwdmaxlen=$((${COLUMNS:-20}/3))
    if [ ${#_WORKING_DIR} -gt $pwdmaxlen ] ; then
        _WORKING_DIR="…${_WORKING_DIR: -$pwdmaxlen}";
    fi
    _WORKING_DIR="$_CB$_WORKING_DIR$_CN"
}

PROMPT_COMMAND='_set_exit_info;_set_working_dir;PS1="$_WORKING_DIR$_GIT_INFO$_EXIT_INFO "'
