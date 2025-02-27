# 🔍✒️  sed

GNU and BSD `sed` differ in the way they implement the `--in-place` / `-i` parameter:

* 🍏 BSD (and Mac OS): it requires an explicit backup extension
  (with `-i ''` for in-place editing without backup)
* 🐧 GNU: it works fine without any argument

For cross platform compatibility, use (this works for bash v3+):

```shell
# Make GNU and BSD sed cross platform
if [ "$(uname)" = "Darwin" ]; then
    _SSDF_SED_IN_PLACE=(-i "") # BSD sed (eg Mac OS)
else
    _SSDF_SED_IN_PLACE=(-i) # GNU sed (eg Ubuntu)
fi

sed "${_SSDF_SED_IN_PLACE[@]}" -e "s/SEARCH/REPLACE/g"
```

> ℹ️  _sed options used_:
> * `-e script` / `--expression=script`
>    add the script to the commands to be executed
> * `-i[SUFFIX]` / `--in-place[=SUFFIX]`
>    edit files in place (makes backup if SUFFIX supplied)

## Recursively replace text in a pattern of files

To find recursively the files that contain text matching a given pattern,
and replace those matches in place:

```shell
# Make GNU and BSD sed cross platform
if [ "$(uname)" = "Darwin" ]; then
    _SSDF_SED_IN_PLACE=(-i "") # BSD sed (eg Mac OS)
else
    _SSDF_SED_IN_PLACE=(-i) # GNU sed (eg Ubuntu)
fi

grep -r -l '<PATTERN>' . \
    | xargs sed "${_SSDF_SED_IN_PLACE[@]}" -e "s/<PATTERN>/<REPLACE>/g"
```

> ℹ️  _grep options used_:
> * `-r` / `--recursive`
>    reads all files under each directory, recursively
> * `-l` / `--files-with-matches`
>    prints only the name of each matching files

