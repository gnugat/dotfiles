#!/usr/bin/env bash
# File: /21-git/bin/git-clone.sh
# ──────────────────────────────────────────────────────────────────────────────
# Clones a GitHub repository to ~/Projects/{username}/{repository}.
#
# Usage:
#
# ```shell
# git-clone.sh redaktilo
# git-clone.sh doctrine-bundle symfony
# ```
#
# Arguments:
#
# 1. `repository`: repository name (required)
# 2. `username`: GitHub username, defaults to `gnugat`
# ──────────────────────────────────────────────────────────────────────────────

_GIT_CLONE_REPOSITORY=$1
_GIT_CLONE_USERNAME=${2:-gnugat}
_GIT_CLONE_PATH="${HOME}/Projects/${_GIT_CLONE_USERNAME}/${_GIT_CLONE_REPOSITORY}"
_GIT_CLONE_HOST="github.com"

if [ -z "${_GIT_CLONE_REPOSITORY}" ]; then
    echo "  [ERROR] Repository name is required"
    echo "  Usage: git-clone.sh <repository> [username]"
    exit 1
fi

mkdir -p "$(dirname "${_GIT_CLONE_PATH}")"

# Check if SSH config has a specific host for this username
if ssh -F ~/.ssh/config -G "${_GIT_CLONE_USERNAME}.github.com" >/dev/null 2>&1; then
    _GIT_CLONE_HOST="${_GIT_CLONE_USERNAME}.github.com"
fi

git clone "git@${_GIT_CLONE_HOST}:${_GIT_CLONE_USERNAME}/${_GIT_CLONE_REPOSITORY}.git" "${_GIT_CLONE_PATH}"
