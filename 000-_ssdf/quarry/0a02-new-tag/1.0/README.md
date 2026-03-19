# 🪨🏷️  New Tag

Adds support for a new tag.

```console
_SSDF_INPUT_TAG_ID='40' \
    _SSDF_INPUT_TAG_NAME='ubuntu' \
    _SSDF_INPUT_TAG_EMOJI='🍊' \
    _SSDF_INPUT_TAG_TITLE='Ubuntu (OS specific)' \
    _SSDF_INPUT_TAG_SHORT_DESCRIPTION='The Canonical packages.' \
    bash ~/.dotfiles/000-_ssdf/quarry/0a02-new-tag/1.0/install.sh
```

This will:

* copy the block's `templates` directory to `400-_ubuntu`
* replace in files (eg `README.md`) the following placeholders:
    * `{{ _SSDF_INPUT_TAG_ID }}`
    * `{{ _SSDF_INPUT_TAG_NAME }}`
    * `{{ _SSDF_INPUT_TAG_EMOJI }}`
    * `{{ _SSDF_INPUT_TAG_TITLE }}`
    * `{{ _SSDF_INPUT_TAG_VERY_SHORT_DESCRIPTION }}`
    * `{{ _SSDF_INPUT_TAG_SHORT_DESCRIPTION }}`

So for example it'll create the following:

```
.
├── 300-_bang/
└── 400-_ubuntu/
    └── README.md
```
