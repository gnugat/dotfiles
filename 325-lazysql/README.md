# 🗃️ lazysql

A lazy TUI database explorer.

## Config

lazysql supports a TOML config file, defaulting to `~/.config/lazysql/config.toml`.

This file is not committed. On install, `config/config.toml.example` is copied to
`~/.config/lazysql/config.toml` if the file doesn't already exist.

### Multiple databases

Define multiple `[[database]]` entries in the config. Launching lazysql without
a URL starts in picker mode, letting you choose which one to connect to.

### Vault authentication

Use `lazysql-vault <connection-name>` to connect via Vault's database secrets
engine. Connections are defined in `~/.config/lazysql/vault.json` (not committed).
On install, `config/vault.json.example` is copied there if the file doesn't exist.

Credentials are fetched in a single `vault read` call (to get a matching
username/password pair from the same lease), URL-encoded, and passed directly
to lazysql. The vault CLI reads the token from `~/.vault-token` by default.
