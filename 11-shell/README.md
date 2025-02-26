# 🐚 shell

On installation, appends the following line (if it wasn't added already):

```bash
source /home/<user>/.config/shell/common.sh
```

To the following files (if they exist):

* `~/.profile`
* `~/.bashrc`
* `~/.zshrc`

---

The `common.sh` script sources the following scripts from `~/.config/shell/`:

* `alias.sh`: common shell aliases (eg `la='ls -A'`)
* `alias.local.sh`: user customizations (eg `la='tree -a -L 1'`)
* `envvars.sh`: common shell environment variables (eg `HISTSIZE=10000`)
* `envvars.local.sh`: user customizations (eg `EDITOR=$(which nvim)`)
* `path.sh`: common shell executable paths (eg `~/bin`)
* `path.local.sh`: user customizations (eg `~/bin`)

> _Note_: The `*.local.sh` scripts are:
>
> * not versioned
> * sourced **after** their non local counterpart
> * meant to contain user customizations (eg `EDITOR=$(which nvim)`)

---

For packages aliases and environment variable management,
take inspiration from `less`:

* it has a `/less/config/envvars.less.sh` script
* its `/less/install.sh` script:
    * creates a symlink in `~/.config/less/envvars.less.sh`
    * appends to `~/.config/shell/envvars.local.sh`
      a `source /home/<user>/.config/less/envvars.less.sh` line

