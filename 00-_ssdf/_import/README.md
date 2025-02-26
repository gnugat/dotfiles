# Import

Most SSDF scripts (and some configs) require importing other scripts,
for this **they need to know their own location** (or SSDF's root location).

This can be tricky very quickly, as the script can be:

* either sourced (`source ~/.profile`), or executed (`bash ./install.sh`)
* called directly, or called from another script (or config)
* called through a symbolic link
* called from any shells (bash, zsh), and any OS (Ubuntu, Mac OS)

Let's set up some example files, and explore the different options.

## Example

We're first going to check how the `$0` and `$BASH_SOURCE[0]` variables
can help us.

Let's consider the following set up:

```shell
mdkir -p /tmp/project/package
touch /tmp/project/package/config.sh
touch /tmp/project/package/script.sh
touch /tmp/project/install.sh

mdkir -p /tmp/config
ln -nsf /tmp/project/package/config.sh /tmp/config/link.sh

touch /tmp/profile
```

First, let's simulate the `~/.profile` (shell config) file:

```bash
#!/usr/bin/env bash
# File: /tmp/profile

source /tmp/config/link.sh
```

Then, let's emulate a package config file:

```bash
#!/usr/bin/env bash
# File: /tmp/project/package/config.sh

echo ''
echo '/tmp/project/package/config.sh'
echo "£0:              $0"
echo "£BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
```

Next, let's introduce a package script file:

```bash
#!/usr/bin/env bash
# File: /tmp/project/package/script.sh

echo ''
echo '/tmp/project/package/script.sh'
echo "£0:              $0"
echo "£BASH_SOURCE[0]: ${BASH_SOURCE[0]}"
```

Finally, let's create the install script (which calls a package script):

```bash
#!/usr/bin/env bash
# File: /tmp/project/install.sh

echo ''
echo '/tmp/project/install.sh'
echo "£0:              $0"
echo "£BASH_SOURCE[0]: ${BASH_SOURCE[0]}"

source /tmp/project/package/script.sh
```

All set! Now let's see how these variables behave. 

### Running bash install

#### 💲 In bash

Executing the install script, from the project's directory, in a bash shell:

```shell
/tmp/project $ bash ./install.sh

/tmp/project/install.sh
£0:              install.sh
£BASH_SOURCE[0]: install.sh

/tmp/project/package/script.sh
£0:              install.sh
£BASH_SOURCE[0]: /tmp/project/package/script.sh
```

Here, `$0` gives us the name of the main script run (`install.sh`),
without any path information.

As for `$BASH_SOURCE[0]`, for `bash ./install.sh` it behaves the same as `$0`,
but for `source /tmp/project/package/script.sh` it gives us the currently
sourced script's absolute path.

#### % In zsh

Executing the install script, from the project's directory, in a zsh shell:

```shell
/tmp/project $ bash ./install.sh

/tmp/project/install.sh
£0:              install.sh
£BASH_SOURCE[0]: install.sh

/tmp/project/package/script.sh
£0:              install.sh
£BASH_SOURCE[0]: /tmp/project/package/script.sh
```

As one would expected, this is exactly identical to running it in a bash shell.
We are, after all, running the script through bash itself!

### Running source profile

#### 💲 In bash

Sourcing the `~/.profile` (shell's config), from the user's home directory,
in a bash shell:

```shell
/tmp $ source ./profile

/tmp/project/package/config.sh
£0:              -bash
£BASH_SOURCE[0]: /tmp/config/link.sh
```

Here, `$0` gives us the name of the shell used (`-bash`).

As for `$BASH_SOURCE[0]`,
it gives us the absolute path of the symbolic link `link.sh`.

#### % In zsh

Sourcing the `~/.profile` (shell's config), from the user's home directory,
in a zsh shell:

```shell
/tmp $ source ./profile

/tmp/project/package/config.sh
£0:              /tmp/config/link.sh
£BASH_SOURCE[0]: 
```

Now, that's completly different!

Here `$0` gives us the absolute path to the symbolic link (`link.sh`),
while `$BASH_SOURCE[0]` is empty.

## Solution

To get the `script.sh`'s absolute path, we'll need to rely most of the time on
`$BASH_SOURCE[0]`, except when it's empty, then we'll fallack to `$0`:

```bash
#!/usr/bin/env bash
# File: /tmp/project/package/config_portable.sh

echo ''
echo '/tmp/project/package/config_portable.sh'
echo "£BASH_SOURCE[0] ?? £0: ${BASH_SOURCE[0]:-$0}"
```

There are two ways to deal with symbolic link:

* `realpath`
* `readlink -f`

Both of these options seemed to have had portability in the past,
but should now be readily available everywhere and behaving similarly.

> _Sources_:
> * [is realpath available everywhere?](https://unix.stackexchange.com/questions/136494/whats-the-difference-between-realpath-and-readlink-f)
> * [is readlink -f available everywhere?](https://scriptingosx.com/2022/03/some-cli-updates-in-macos-monterey/)

To only get the path, with the script's name strip, we can use:

* `dirname`

Which is why, in most SSDF scripts we'll find at the top the following lines:

```bash
#!/usr/bin/env bash

_SSDF_PACKAGE_DIR="$(dirname "$(readlink -f "${BASH_SOURCE[0]:-$0}")")"
SSDF_ROOT_DIR="$(realpath "${_SSDF_PACKAGE_CONFIG_DIR}/..")"
source "${SSDF_ROOT_DIR}/00-_ssdf/functions.sh"
```
