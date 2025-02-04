# 🔵 Super Secret Dotfiles (SSDF)

This repository helps me to backup, restore and synchronise
my shell / system preferences and settings.

> ℹ️  _Note_: I'm afraid I'm not using any poncy tools to manage my Dotfiles.
> No Ansible, chezmoi, stow, whatsoever.
>
> Just regular bash scripts and symbolic links,
> find out more in _Philosophy_ section. 

## ⚙️  Installation

> _Requirements (most of these should be installed by default)_:
>
> * `apt-utils`: to enable interactive configuration
> * `bash`: to be able to run the installation scripts
> * `ca-certificates`: to be to downloaded through HTTPS
> * `curl`: to be able to download the repository as an archive
> * `libreadline-dev`: to enable interactive configuration
> * `tar`: to extract the files from the downloaded archive
> * _optionally `git`: to be able to clone this repository_

**🚀 Quick Install:**

```shell
curl -fsSL 'https://github.com/gnugat/dotfiles/archive/main.tar.gz' | tar -xz && cd dotfiles-main && bash ./install.sh
```

Once the script is done, don't forget to run `source ~/.profile` to reload the config.

> ℹ️  _Note_: The **Quick Install** method is perfect for ephemeral environments,
> like a Docker container for example.
> 
> Clone the git repository for more more permanent environments (aka **Git Install**),
> this will allow yuo to get updates (using `git pull`):
> 
> ```shell
> git clone git@github.com:gnugat/dotfiles.git && cd dotfiles && bash ./install.sh
> ```

## 🌳 Philosophy / Structure

The tree directory follows this convention:

```
.
├── <package>
│   ├── _<package-manager>.sh
│   ├── config/
│   └── install.sh
└── install.sh
```

The root `install.sh` script's responsibility is to:

* select a Package Manager
  * currently supported: `apt`
* for each Package directory, call its `<package>/install.sh` script

> ℹ️  _Note_: It's possible to manually select the Package Manager as follow:
>
> ```shell
> _SSDF_PACKAGE_MANAGER=apt bash ./install.sh
> ```
>
> If `_SSDF_PACKAGE_MANAGER` isn't provided, then the script will pick one automatically.

As for each `<package>/install.sh` script, their responsibility is to:

* install the package using the selected Package Manager with `<package>/_<package-manager>.sh`
  * eg `sudo apt -qqy installl git`
* create symlinks from files in `<package>/config/` to `~/`
  * eg `ln -nsf ./git/config/gitconfig ~/.gitconfig`
* do some extra stuff like installing plugins, themes nd whatnot

> ℹ️  _Notes_:
> * the `install.sh` scripts can safely be run many times
>   * this allows for updates
>   * ⚠️  no backups are made, and some artefacts might be left behind,
         make sure to double check and manually backup/clean
> * each `<package>/install.sh` can also be run individually directly
>   * they also automatically select the Package Manager
>   * they also accept `_SSDF_PCKG_MNGR` to manually selected the Package Manager

## 🐋 Testing - Docker Container

> _Requirements_:
>
> * `docker`: to be able to build and run the container

The `Dockerfile.<package-manager>` files are provided to try the repo, eg:

```shell
# For Ubuntu, using the `apt` Package Manager
docker build -t gnugat/dotfiles-apt -f Dockerfile.apt .
docker run --rm -it gnugat/dotfiles-apt
```

This will provide you with:

* a minimal Ubuntu container
* the specified package manager (eg `apt`)
* `apt-utils`, `bash`, `ca-certificates`, `curl`, `libreadline-dev` and `tar`
  bundled with it to be able to install the Dotfiles
* a `ubuntu` user (with sudo power), in their home `/home/ubuntu` directory

You can then install the Dotfiles using the **Quick Install** instructions
described earlier (`head -n 28 README.md | tail -n 5`).

> **Note**: Remember that once you exit the container, all changed are lost.
> If you run the container again, you'll need to install the Dotfiles once more.

## 🤝 Be kind 

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
