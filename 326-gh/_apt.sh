#!/usr/bin/env bash
# File: /326-gh/_apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍊🐙 Installing gh, on Ubuntu (apt).
# gh is not in Ubuntu's default registry, using GitHub's official apt repository.
# ──────────────────────────────────────────────────────────────────────────────

if ! command -v gh &>/dev/null; then
    sudo mkdir -p -m 755 /etc/apt/keyrings
    wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg \
        | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
    sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" \
        | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt-get update -qq
fi
sudo apt-get -qqy install gh
