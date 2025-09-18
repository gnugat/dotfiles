# 🪪🐙 New Git Identity

Adds a new git identity for organization-specific repositories.

```console
_SSDF_INPUT_ORGANIZATION='prima' \
    _SSDF_INPUT_HOST_ALIAS='prima.github.com' \
    _SSDF_INPUT_GITHUB_ORG='primait' \
    _SSDF_INPUT_USER_NAME='Loïc Faugeron' \
    _SSDF_INPUT_USER_EMAIL='loic.faugeron@helloprima.com' \
    _SSDF_INPUT_GITHUB_USER='loic-faugeron-prima' \
    bash ~/.dotfiles/00-_ssdf/quarry/0a03-new-git-identity/1.0/install.sh
```

This will:

* create a git identity config file at `~/.config/git/user/{{ _SSDF_INPUT_ORGANIZATION }}`
* add an includeIf section to the main git config for repositories using `{{ _SSDF_INPUT_HOST_ALIAS }}`
* replace placeholders with the provided values

So for example it'll create:

```
~/.config/git/user/prima
```

And add to `21-git/config/config`:

```
# Prima work
[includeIf "hasconfig:remote.*.url:git@prima.github.com:primait/**"]
    path = ~/.config/git/user/prima
```
