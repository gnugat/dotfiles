# 🔍✒️  sed

The 🍏 BSD sed (Mac OS) and 🐧 GNU sed (Ubuntu) implementations differ slightly.

The following functions provide a cross-platform solution:

* `_ssdf_sed` (for standalone `sed`)
* `ssdf_grep_sed` (for `grep | xargs sed`)

## In place `sed -i SCRIPT`

* 🍏 BSD sed (Mac OS): requires an explicit backup extension
  (with `-i ''` for in place editing without backup)
* 🐧 GNU sed (Ubuntu): does NOT accept backup extension

To make it work across both platforms:

```shell
if [ "$(uname)" = "Darwin" ]; then
    _SSDF_SED_IN_PLACE=(-i "") # 🍏 BSD sed (Mac OS)
else
    _SSDF_SED_IN_PLACE=(-i) # 🐧 GNU sed (Ubuntu)
fi

sed "${_SSDF_SED_IN_PLACE[@]}" -e "s/<SEARCH>/<REPLACE>/g"
```

## Append after `/<PATTERN>/a<ADDITION>`
## Insert before `/<PATTERN>/i<ADDITION>`

* 🍏 BSD sed (Mac OS): requires the command `a` / `i` to be followed by:
    1. `\` -- which is ignored by 🐧 GNU sed (Ubuntu)
    2. a new line
    3. the text to append/insert
* 🐧 GNU sed (Ubuntu): none of this nonsense

To achieve this in a way that works for both 🍏 BSD (Mac OS) and
🐧 GNU sed (Ubuntu), split the text to insert/append in a second `-e`:

```shell
sed "${_SSDF_SED_IN_PLACE[@]}" \
    -e '/* first line in list/a\' \
    -e '* second line in list' \
    /tmp/list.txt
```

> 💯 The above approach is our Super Secret recommended way.

Another cross-platform compatible way would be to store the command in a file
and use the `-f <script>` syntax.

### 🍏 BSD sed (Mac OS) specific alternatives

> 🚫 These will NOT work with 🐧 GNU sed (Ubuntu).

An actual new line can be used:

```shell
sed -i '' \
    -e '/* first line in list/a\\
* second line in list' \
    /tmp/list.txt
```

It's also possible, to use `'$'\n`:

```shell
sed -i '' \
    -e '/* first line in list/a\'$'\n* second line in list' \
    /tmp/list.txt
```

## Replace all in path `grep PATTERN PATH | xargs sed -i SCRIPT`

To find recursively the files that contain text matching a given pattern,
and replace those matches in place:

```shell
_SSDF_MATCHED_FILES=$(grep -r -l '<PATTERN>' .)
if [ ! -z "${_SSDF_MATCHED_FILES}" ]; then 
    echo "${_SSDF_MATCHED_FILES}" \
        | xargs sed "${_SSDF_SED_IN_PLACE[@]}" -e "s/<PATTERN>/<REPLACE>/g"
fi
```

> ℹ️  _grep options used_:
> * `-r` / `--recursive`
>    reads all files under each directory, recursively
> * `-l` / `--files-with-matches`
>    prints only the name of each matching files

