#!/usr/bin/env bash
# File: /700-_tarakava/config/demat.tarakava.sh
# ──────────────────────────────────────────────────────────────────────────────
# 🚙 Tarakava daily routine.
# ──────────────────────────────────────────────────────────────────────────────

## ─────────────────────────────────────────────────────────────────────────────
## 🏷️  Hostname fix (reset by Kandji MDM on every reboot).
## ─────────────────────────────────────────────────────────────────────────────
sudo scutil --set HostName 'tarakava'
sudo scutil --set LocalHostName 'tarakava'
sudo scutil --set ComputerName 'tarakava'

## ─────────────────────────────────────────────────────────────────────────────
## 🔑 SSH keys.
## ─────────────────────────────────────────────────────────────────────────────
ssh-add --apple-use-keychain ~/.ssh/loic-faugeron-prima

## ─────────────────────────────────────────────────────────────────────────────
## ☁️  Cloud access.
## ─────────────────────────────────────────────────────────────────────────────
aws sso login --profile primaglobal
aws ecr get-login-password --profile=primaglobal --region eu-west-1 \
    | docker login --username AWS --password-stdin 844756865900.dkr.ecr.eu-west-1.amazonaws.com
aws sso login --profile primalegacy
aws ecr get-login-password --profile=primalegacy --region eu-west-1 \
    | docker login --username AWS --password-stdin 001575623345.dkr.ecr.eu-west-1.amazonaws.com

## ─────────────────────────────────────────────────────────────────────────────
## 🛡️  Behind Cloudflare WARP (skipped if WARP is not connected).
## ─────────────────────────────────────────────────────────────────────────────
if warp-cli -j status 2>/dev/null | grep -Eq '"status": *"Connected"'; then
    # Vault
    vault login -method=oidc -path=okta --no-print

    # MFE - npm (JFrog)
    npm login --registry=https://prima.jfrog.io/artifactory/api/npm/pyxis/ --auth-type=web --scope=@pyxis
    npm login --registry=https://prima.jfrog.io/artifactory/api/npm/datadog-global/ --auth-type=web --scope=@primait
else
    echo '⚠️  Cloudflare WARP not connected: skipping vault and JFrog npm logins'
fi
