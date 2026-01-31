#!/usr/bin/env bash
# File: /21-git/bin/git-fetch.sh
# ──────────────────────────────────────────────────────────────────────────────
# Fetches with prune, then removes local branches tracking deleted remotes.
#
# Usage:
#
# ```shell
# git-fetch.sh
# ```
#
# This command:
# 1. Runs `git fetch -p` to prune remote tracking branches
# 2. Finds local branches whose upstream has been deleted (marked as "gone")
# 3. Removes those local branches
# ──────────────────────────────────────────────────────────────────────────────

echo "Fetching and pruning remote tracking branches..."
git fetch -p

echo "Checking for local branches tracking deleted remotes..."
_GIT_FETCH_GONE_BRANCHES=$(git branch --no-color -vv | awk '/: gone]/{print $1}')

if [ -z "$_GIT_FETCH_GONE_BRANCHES" ]; then
    echo "No local branches tracking deleted remotes found."
else
    echo "Removing local branches tracking deleted remotes:"
    echo "$_GIT_FETCH_GONE_BRANCHES" | xargs -n 1 git branch -D
fi
