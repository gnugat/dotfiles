#!/usr/bin/env bash
# File: /101-shell/config/aliases.apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 😎🍊 ALIAS management, for Ubuntu's apt.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📰 System update.
## ─────────────────────────────────────────────────────────────────────────────
alias apt_up='
sudo apt-get --allow-releaseinfo-change update;
sudo apt-get -qqy upgrade
sudo apt-get -qqy full-upgrade
sudo apt-get -qqy autoremove --purge
sudo apt-get -qqy autoclean
sudo apt-get -qqy clean
sudo snap refresh'
