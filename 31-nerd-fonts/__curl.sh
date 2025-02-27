#!/usr/bin/env bash
# File: /31-nerd-fonts/_apt.sh
# ──────────────────────────────────────────────────────────────────────────────
# 📰🌐🤓 Installing nerd-fonts (curl).
# ──────────────────────────────────────────────────────────────────────────────

_SSDF_OS=$(uname)
_SSDF_FONT_DIR="${HOME}/Library/Fonts"
if [ "Darwin" != "${_SSDF_OS}" ]; then
    _SSDF_FONT_DIR="${HOME}/.local/share/fonts"
    mkdir -p "${_SSDF_FONT_DIR}"
fi

for _SSDF_NERD_FONT in $SSDF_NERD_FONTS; do
    curl -sfLo "/tmp/${_SSDF_NERD_FONT}.zip" \
        "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/${_SSDF_NERD_FONT}.zip"

    unzip -q -o "/tmp/${_SSDF_NERD_FONT}.zip" -d "${_SSDF_FONT_DIR}"
    rm "/tmp/${_SSDF_NERD_FONT}.zip"

    if [ "Darwin" != "${_SSDF_OS}" ]; then
        fc-cache -f
    fi
done
