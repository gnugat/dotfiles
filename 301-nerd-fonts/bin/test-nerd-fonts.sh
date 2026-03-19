#!/usr/bin/env bash
# File: /301-nerd-fonts/bin/test-nerd-fonts.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🧪🤓 Testing script, to see if Nerd Fonts are installed.
# Credits: https://gist.github.com/elijahmanor/c10e5787bf9ac6b8c276e47e6745826c?permalink_comment_id=4552247#gistcomment-4552247
# ──────────────────────────────────────────────────────────────────────────────

smoke_tests="Normal
\033[1mBold\033[22m
\033[3mItalic\033[23m
\033[3;1mBold Italic\033[0m
\033[4mUnderline\033[24m
== === !== >= <= =>
契          勒 鈴 "

printf "%b" "${smoke_tests}"
