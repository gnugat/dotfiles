# dotfiles

My Super Secret configuration files.

This repository helps me to backup, restore and synchronize them
(and will install my favourite productivity apps).

## Installation

Requirements:

* `git`: to be able to clone this repository
* `bash`: to be able to run the installation scripts

To install and setup, clone the repo and run its root `install.sh` script: 

```
git clone git@github.com:gnugat/dotfiles.git
cd ./dotfiles
bash ./install.sh
```

## Organizational Approach

The tree directory follows the following convention:

```
.
├── <package>
│   ├── _apt.sh
│   ├── _brew.sh
│   ├── config/
│   └── install.sh
└── install.sh
```

The root `install.sh` script calls each `<package>/install.sh` scripts.

Each `<package>/install.sh` script will:

* check which package manager is installed
  (eg `apt` for Ubuntu, or `brew` for Mac OS)
* call the respective `_<package-manager>.sh` script to install the package
  (eg `sudo apt install ackl`)
* create symlinks for the configuration files located in `<package>/config/`
  (eg `ln -nsf ./ack/config/dot_ackrc ~/.ackrc`)

## Testing - Docker Container

A `Dockerfile` is provided to try the repo:

```console
docker build -t gnugat/dotfiles .
docker run -rm -it gnugat/dotfiles
```

This will provide you with:

* an empty/base Ubuntu container
* `bash` and `git ` installed
* a `ubuntu` user, in their home `/home/ubuntu` directory

> **Note**: It's also possible to try it in your own/project containers,
> _at your own risk_.

You can then install the dotfiles in the container as follow:

```console
git config --global http.sslVerify false
git clone https://github.com/gnugat/dotfiles.git
cd ./dotfiles
bash ./install.sh
```

> **Note**: Remember that once you exit the container all change will be lost,
> and the dotfiles will need to be installed once again.

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
