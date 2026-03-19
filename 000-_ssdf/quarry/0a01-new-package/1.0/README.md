# 🪨🎁 New Package

Adds support for a new package.

```console
_SSDF_INPUT_PACKAGE_ID='31' \
    _SSDF_INPUT_PACKAGE_NAME='nerd-fonts' \
    _SSDF_INPUT_PACKAGE_EMOJI='🤓' \
    _SSDF_INPUT_PACKAGE_TITLE='Nerd Fonts' \
    _SSDF_INPUT_PACKAGE_SHORT_DESCRIPTION='Iconic font aggregator, collection, and patcher.' \
    bash ~/.dotfiles/000-_ssdf/quarry/0a01-new-package/1.0/install.sh
```

This will:

* copy the block's `templates` directory to `301-nerd-fonts`
* replace in files (eg `README.md`) the following placeholders:
    * `{{ _SSDF_INPUT_PACKAGE_ID }}`
    * `{{ _SSDF_INPUT_PACKAGE_NAME }}`
    * `{{ _SSDF_INPUT_PACKAGE_EMOJI }}`
    * `{{ _SSDF_INPUT_PACKAGE_TITLE }}`
    * `{{ _SSDF_INPUT_PACKAGE_SHORT_DESCRIPTION }}`

So for example it'll create the following:

```
.
├── 300-_bang/
└── 301-nerd-fonts/
    ├── config/
    │   ├── aliases.package.sh
    │   └── envvars.package.sh
    ├── _apt.sh
    ├── _brew.sh
    ├── install.sh
    └── README.md
```
