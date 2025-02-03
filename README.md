# dotfiles

This repository contains the configuration files of the CLI tools I use
(ack, bash, git, PHP, postgres, vim, etc).
Its purpose is to backup, restore and synchronize them.

## Installation

```
git clone git@github.com:gnugat/dotfiles.git
cd dotfiles
bash ./install.sh
```

## Organizational Approach

The tree directory follows the following convention:

```
.
├── <tool>
│   ├── _apt.sh
│   ├── <config>
│   └── install.sh
└── install.sh
```

At the root, the main `install.sh` script runs:

1. each tools' `_apt.sh` scripts
2. each tools' `install.sh` scripts

Each tool will have its own folder, which *MIGHT* contain:

* an `_apt.sh` script that registers the APT repository
* a `<config>` file or folder containing the tool's configuration
* an `install.sh` script that runs the command to install it and its config

Some of the config files *MIGHT* be aliased as dotfiles in the user's home directory.

## Testing

To try the dotfiles, you might use the configured test Docker container:

```console
docker build -t gnugat/dotfiles .
docker run -rm -it gnugat/dotfiles
```

This will provide you with:

* an empty/base Ubuntu container
* `bash` and `git ` installed
* a `ubuntu` user, in their home `/home/ubuntu` directory

You can then install the dotfiles in the container as follow:

```console
git config --global http.sslVerify false
git clone https://github.com/gnugat/dotfiles.git
cd ./dotfiles
bash ./install.sh
```

When you exit the container, all changes will be lost (running the container
again will require you to install the dotfiles once more).

## Be kind 

Please note that this project is released with a Contributor Code of Conduct.
By participating in this project you agree to abide by its terms.

See [Contributor Covenant Code of Conduct](https://www.contributor-covenant.org/version/2/0/code_of_conduct/).

It is also using the Hippocratic License, which means that this project is Open
Source, but it is forbidden to use it in a way that promotes or profits from:

* violence, hate and division,
* environmental destruction,
* abuse of human rights,
* the destruction of people’s physical and mental health

See [Hippocratic License](https://firstdonoharm.dev/version/2/1/license.html).
