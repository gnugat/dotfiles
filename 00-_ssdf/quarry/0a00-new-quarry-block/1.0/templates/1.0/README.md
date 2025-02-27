# {{ _SSDF_INPUT_BLOCK_EMOJI }} {{ _SSDF_INPUT_BLOCK_TITLE }}

{{ _SSDF_INPUT_BLOCK_SHORT_DESCRIPTION }}

```console
_SSDF_INPUT_BLOCK_DESTINATION_DIR='my_dir' \
    _SSDF_INPUT_VAR_1='value1' \
    _SSDF_INPUT_VAR_2='value2' \
    bash ~/.dotfiles/00-_ssdf/quarry/{{ _SSDF_INPUT_BLOCK_ID }}-{{ _SSDF_INPUT_BLOCK_NAME }}/1.0/install.sh
```

This will:

* copy the block's `templates` directory to `_SSDF_INPUT_BLOCK_DESTINATION_DIR`
* replace in files (eg `README.md`) the following placeholders:
    * `{{ _SSDF_INPUT_VAR_1 }}`
    * `{{ _SSDF_INPUT_VAR_2 }}`

So for example it'll create the following:

```
.
└── my_dir/
    ├── folder1/
    ├── file1
    └── file2
```
