#!/usr/bin/env bash
# File: /302-fastfetch/_apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🍊📊 Installing fastfetch, on Ubuntu (apt).
# ──────────────────────────────────────────────────────────────────────────────

sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt-get -qq update
sudo apt-get -qqy install fastfetch
