# 🌸 fzf

A command-line fuzzy finder.

## Usage

### Keybindings

* `Ctrl + t`: looks for files and directories under the current working directory
* `Alt + t`: like `Ctrl + t`, but on selection runs `cd` on it
* `Ctrl + r`: looks for shell history

### Fuzy Finder navigation

In the Fuzzy Finder window:

* `Ctrl + c`: exit
    * or `Ctrl + g` / `Esc`
* `Ctrl + j` / `Ctrl + k`: go down / up
    * or `Ctrl + n` / `Ctrl + p`
* `Tab`: select one or more results
* `Shift + Tab`: unselect one or more results
* `Enter`: accept selection

### Completion

* `COMMAND [DIRECTORY/][FUZZY_PATTERN]**<TAB>`: will behave like `Ctrl + t`

Examples:

```shell
# Files and Directories
vim ./**<Tab>
cd ./**<Tab>

# Process IDs
kill -9 **<Tab>

# Host names
ssh **<Tab>
```
