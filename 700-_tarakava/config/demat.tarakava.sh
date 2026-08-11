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
aws sso login --profile conversions-staging
aws ecr get-login-password --profile=conversions-staging --region eu-west-1 \
    | docker login --username AWS --password-stdin 279066465364.dkr.ecr.eu-west-1.amazonaws.com
vault login -method=oidc -path=okta --no-print
