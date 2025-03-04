# 🔺 Alacritty

A cross-platform, OpenGL terminal emulator.

## Post-Install

After installing on a Mac, after opening Alacritty if an error happens
("Apple cannot check it for malicious software"), then:

* click "OK"
* go to System Settings...
* go to Privacy & Security
* click "Open Anyway"

## Changing the config

There's a backward compatibility break in v0.14:

* `import` config got moved to `general` new section

To maintain only one config file (`alacritty.toml`) file,
`bin/sync-config.sh` can be run. This script:

* copies the `alacritty.toml` file to `alacritty.old.toml`
* removes the `[general]` section

The `install.sh` script makes sure to make a symbolic link with the correct
version (`alacritty.toml` on version >0.14, `alacritty.old.toml` otherwise).
