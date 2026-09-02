#!/usr/bin/env bash
# File: /600-_nui-rama/config/demat.nui-rama.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🐝 Nui-Rama daily routine.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏷️  Hostname fix (reset by MDM on every reboot).
## ─────────────────────────────────────────────────────────────────────────────
sudo scutil --set HostName 'nui-rama'
sudo scutil --set LocalHostName 'nui-rama'
sudo scutil --set ComputerName 'nui-rama'
