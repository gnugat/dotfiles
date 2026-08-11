#!/usr/bin/env bash
# File: /400-_ubuntu/config/demat.ubuntu.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🍊 Ubuntu daily routine.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 📰 System update.
## ─────────────────────────────────────────────────────────────────────────────
sudo apt-get --allow-releaseinfo-change update
sudo apt-get -qqy upgrade
sudo apt-get -qqy full-upgrade
sudo apt-get -qqy autoremove --purge
sudo apt-get -qqy autoclean
sudo apt-get -qqy clean
sudo snap refresh
