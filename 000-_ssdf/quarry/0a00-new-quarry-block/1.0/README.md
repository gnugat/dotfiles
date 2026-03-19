# 🪨🧊 New Quarry Block

Create new Quarry of Creation block, by running:

```console
_SSDF_INPUT_BLOCK_ID='0a01' \
    _SSDF_INPUT_BLOCK_NAME='new-package' \
    _SSDF_INPUT_BLOCK_EMOJI='🪨🎁' \
    _SSDF_INPUT_BLOCK_TITLE='New Package' \
    _SSDF_INPUT_BLOCK_SHORT_DESCRIPTION='Adds support for a new package.' \
    bash ~/.dotfiles/000-_ssdf/quarry/0a00-new-quarry-block/1.0/install.sh
```

This will:

* copy the block's `templates` directory to `000-_ssdf/quarry/`
* renaming it to `<_SSDF_BLOCK_ID>-<_SSDF_BLOCK_NAME>`
* replace in files (eg `README.md`) the following placeholders:
    * `{{ _SSDF_BLOCK_ID }}`
    * `{{ _SSDF_BLOCK_NAME }}`

So for example it'll create the following:

```
.
└── 000-_ssdf/
    └── quarry/
        ├── 0a00-new-quarry-block/
        └── 0a01-new-package/
            └── 1.0/
                ├── templates/
                ├── install.sh
                └── README.md
```

> ℹ️  _Note_: yes, it's a block to create blocks.
