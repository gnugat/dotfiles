# 📇 Array

Setting a variable as an array, in a bash v3+ (Mac OS) and zsh compatible way:

```bash
#!/usr/bin/env bash

_SSDF_BLOCK_INPUT_NAMES="
_SSDF_BLOCK_INPUT_BLOCK_ID
_SSDF_BLOCK_INPUT_BLOCK_NAME
"

for _SSDF_BLOCK_INPUT_NAME in $_SSDF_BLOCK_INPUT_NAMES; do
    # Indirect expansion to get the referenced ENVVAR's value
    _SSDF_BLOCK_INPUT_VALUE="${!_SSDF_BLOCK_INPUT_NAME}"

    echo "${_SSDF_BLOCK_INPUT_NAME}=${_SSDF_BLOCK_INPUT_VALUE:-<empty>}"
done
```
