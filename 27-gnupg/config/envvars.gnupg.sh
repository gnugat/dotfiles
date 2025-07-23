#!/usr/bin/env bash
# File: /27-gnupg/config/envvars.gnupg.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️ 🔐 ENVVAR management, for gnupg.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏠 Sets gnupg config directory location to ~/.config/gnupg (instead of ~/.gnupg)
## ─────────────────────────────────────────────────────────────────────────────
export GNUPGHOME="${HOME}/.config/gnupg"
export GPG_TTY=$(tty)

