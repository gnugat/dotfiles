#!/usr/bin/env bash
# File: /104-less/config/envvars.less.sh
# ──────────────────────────────────────────────────────────────────────────────
# ♻️ 📄 ENVVAR management, for less.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🎨 Enables syntax highlighting by setting `less` preprocessor.
## ─────────────────────────────────────────────────────────────────────────────
export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"

## ─────────────────────────────────────────────────────────────────────────────
## ⚙️  Sets options for `less`:
## - `F`: `--quit-if-one-screen` exits `less` if content is one page or less
## - `R`: `--RAW-CONTROL-CHARS` displays properly colors and other characters
## - `S`: `--chop-long-lines` enables horizontal scrolling for long lines
## - `X`: `--no-init` speeds up loading by not resetting the screen termcaps
## ─────────────────────────────────────────────────────────────────────────────
export LESS="FRSX"

## ─────────────────────────────────────────────────────────────────────────────
## 🎨 Enables UTF-8 characters (emojis!).
## ─────────────────────────────────────────────────────────────────────────────
export LESSCHARSET=utf-8
