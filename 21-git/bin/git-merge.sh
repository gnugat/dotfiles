#!/usr/bin/env bash
# File: /21-git/bin/git-merge.sh
# ──────────────────────────────────────────────────────────────────────────────
# Merges current branch into main, then deletes local merged branch, and finally pushes.
#
# Usage:
#
# ```shell
# git-merge.sh
# git-merge.sh master
# git-merge.sh master feature-123
# ```
#
# Arguments:
#
# 1. `merge-to-branch`: defaults to `main`
# 2. `merge-from-branch`: defaults to current branch
# ──────────────────────────────────────────────────────────────────────────────

_GIT_MERGE_TO_BRANCH=${1:-main}
_GIT_MERGE_FROM_BRANCH=${2:-$(git branch --show-current)}

if [ "${_GIT_MERGE_TO_BRANCH}" = "${_GIT_MERGE_FROM_BRANCH}" ]; then
    echo "  [ERROR] Cannot merge branch '${_GIT_MERGE_TO_BRANCH}' into itself"
    exit 1
fi

git fetch
git checkout $_GIT_MERGE_TO_BRANCH

if [ "$(git rev-parse HEAD)" != "$(git rev-parse origin/$_GIT_MERGE_TO_BRANCH)" ]; then
    echo "  [ERROR] Local '$_GIT_MERGE_TO_BRANCH' is out of sync with remote, run git-fetch.sh and rebase your branch"
    git checkout $_GIT_MERGE_FROM_BRANCH
    exit 1
fi

git merge --no-ff $_GIT_MERGE_FROM_BRANCH && \
    git branch -D $_GIT_MERGE_FROM_BRANCH && \
    git push
