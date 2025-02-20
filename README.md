# 🔵 Super Secret Dotfiles (SSDF)

This repository helps me backup, restore, synchronise and share
my shell / system preferences and settings.

> ℹ️  **Requirements**:
> - 🍊 Ubuntu (`apt`), or 🍏 Mac OS (`brew`)
> - 💲 `bash` to run the installation scripts
> - 🐙 `git` to clone the repo, or 🌐 `curl` and 📦 `tar` to download it

## 🚀 Installation

Clone the repository in `~/.dotfiles`, then run its root `install.sh` script:

```shell
git clone git@github.com:gnugat/dotfiles.git ~/.dotfiles && cd ~/.dotfiles && bash ./install.sh
```

Once the script is done, don't forget to run `source ~/.profile` to reload the config.

<details>
<summary>🚢 Alternative Installation Options</summary>

🍏 To install on Mac OS (will install homebrew 🍺):

```shell
BRANCH="main" \
    ; mkdir -p "${HOME}/.dotfiles" \
    && curl -fsSL "https://github.com/gnugat/dotfiles/archive/${MAIN}.tar.gz" \
    | tar -xz -C "${HOME}/.dotfiles" --strip-components=1 \
    && cd "${HOME}/.dotfiles" \
    && bash ./install.mac.sh
```

---

🏷️ Instead of installing everything, a list of tags can be specified by setting `_SSDF_TAGS`:

```shell
BRANCH="main" \
    ; mkdir -p "${HOME}/.dotfiles" \
    && curl -fsSL "https://github.com/gnugat/dotfiles/archive/${MAIN}.tar.gz" \
    | tar -xz -C "${HOME}/.dotfiles" --strip-components=1 \
    && cd "${HOME}/.dotfiles" \
    && _SSDF_TAGS="0 1" bash ./install.sh
```

---

🍒 To only install one or more **specific** packages:

```shell
BRANCH="main" \
    ; mkdir -p "${HOME}/.dotfiles" \
    && curl -fsSL "https://github.com/gnugat/dotfiles/archive/${MAIN}.tar.gz" \
    | tar -xz -C "${HOME}/.dotfiles" --strip-components=1 \
    && cd "${HOME}/.dotfiles" \
    && bash ./10-shell/install.sh \
    && bash ./11-bash/install.sh
```

---

⛏️ It's also possible to specify which (supported) package manager to use,
rather than letting the scripts automatically select one by setting `_SSDF_PACKAGE_MANAGER`:

```shell
BRANCH="main" \
    ; mkdir -p "${HOME}/.dotfiles" \
    && curl -fsSL "https://github.com/gnugat/dotfiles/archive/${MAIN}.tar.gz" \
    | tar -xz -C "${HOME}/.dotfiles" --strip-components=1 \
    && cd "${HOME}/.dotfiles" \
    && _SSDF_PACKAGE_MANAGER="brew" bash ./install.sh
```
</details>

## 🌳 Philosophy / Structure

The tree directory follows this convention:

```
.
├── <xy>-<package>
│   ├── _<package-manager>.sh
│   ├── config/
│   ├── install.sh
│   └── README.md
└── install.sh
```

The root `install.sh` script will call all the Package `install.sh` scripts.

The `<xy>` prefix digit indicates the package's:

* `x`: tag
    * `0`: 🏭 internal SSDF functions
    * `1`: 🫗 bare minimum (ideal for ssh servers, or Docker Containers)
    * `2`: 🧱 base (common set up)
* `y`: priority

As for each `<package>/install.sh` script, their responsibility is to:

* 📤 select a Package Manager from one of the supported ones
  * eg `apt` (or `brew`)
* 📦 install the package using the selected Package Manager
  * eg `sudo apt -qqy installl git`
* 🔗 create symlinks of config files to `~/`
  * eg `ln -nsf ./config/gitconfig ~/.gitconfig`
* ➕ do some extra stuff like installing plugins, themes and whatnot

> ℹ️  _Notes_:
> * the `install.sh` scripts can safely be run many times
>   * this allows for updates
>   * ⚠️  no backups are made, and some artefacts might be left behind,
         make sure to double check and manually backup/clean

## 🐋 Docker Container and Testing

A "minimal" setup (prompt and aliases) is available,
for example to spice things up when in a Docker Container:

```shell
BRANCH="main" \
    ; mkdir -p "${HOME}/.dotfiles" \
    && curl -fsSL "https://github.com/gnugat/dotfiles/archive/${MAIN}.tar.gz" \
    | tar -xz -C "${HOME}/.dotfiles" --strip-components=1 \
    && cd "${HOME}/.dotfiles" \
    && _SSDF_TAGS="0 1" bash ./install.sh
```

Speaking of Docker Containers, Dockerfiles are available to try out the repo:

```shell
docker build -t gnugat/dotfiles-apt -f Dockerfile.apt .
docker run --rm -it gnugat/dotfiles-apt
```

> _Note_: The container doesn't come with the dotfiles installed,
> you'll have to run the curl or git command.

<details>
<summary>🍎 Mac Simulator</summary>
The `Dockerfile.brew` provides Ubuntu with linuxbrew and zsh,
to simulate a Mac environment:

```shell
docker build -t gnugat/dotfiles-apt -f Dockerfile.brew .
docker run --rm -it gnugat/dotfiles-brew

# In the brew container:
BRANCH=main \
    ; mkdir -p "${HOME}/.dotfiles" \
    && curl -fsSL "https://github.com/gnugat/dotfiles/archive/${MAIN}.tar.gz" \
    | tar -xz -C "${HOME}/.dotfiles" --strip-components=1 \
    && cd "${HOME}/.dotfiles \
    && _SSDF_PACKAGE_MANAGER="brew" _SSDF_TAGS="0 1 2" bash ./install.sh
```

> _Note_: The `install.mac.sh` script will not work as the container is
> running Linux and not Darwin.
> For the same reason, avoid selecting Ubuntu or Mac specific tags.
</details>

> **Note**: Remember that once you exit the container, all changes are lost.
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
