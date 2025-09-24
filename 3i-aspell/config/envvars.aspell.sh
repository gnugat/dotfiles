#!/usr/bin/env bash
# File: /3i-aspell/config/envvars.aspell.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️ 🔤 ENVVAR management, for aspell.
# ──────────────────────────────────────────────────────────────────────────────

export ASPELL_REPL="repl ${HOME}/.config/aspell/en.prepl"
export ASPELL_PERSONAL="personal ${HOME}/.config/aspell/en.pws"
export ASPELL_CONF="per-conf ${HOME}/.config/aspell/aspell.conf; ${ASPELL_PERSONAL}; ${ASPELL_REPL}"
