# 🏞️  Delta

A syntax-highlighting pager for git, diff, grep, and blame output.

## Toggle side-by-side and line-numbers

Set and Unset the `DELTA_FEATURES` environment variable:

```shell
export DELTA_FEATURES='+side-by-side line-numbers' # Toggle on
export DELTA_FEATURES='+' # Toggle off
```

## Grep

> Delta applies syntax-highlighting and other enhancements to standard grep
> output such as from ripgrep (aka `rg`), `git grep`, `grep`, etc.
> If you don't need special features of `git grep`, then for best results
> pipe `rg --json` output to delta: this avoids parsing ambiguities that are
> inevitable with the output of `git grep` and `grep`.
> To customize the colors and syntax highlighting, see the `grep-*` options in
> `delta --help`.
> 
> Note that `git grep` can display the "function context" for matches and that
> delta handles this output specially: see the `-p` and `-W` options of
> `git grep`.
>
> ```
> rg --json -C 2 handle | delta
> ```
> 
> With `hyperlinks` enabled, the line numbers in the grep output will be
> clickable links. See hyperlinks.
> 
> https://dandavison.github.io/delta/grep.html
