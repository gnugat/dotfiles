# 🤓 Nerd Fonts

Iconic font aggregator, collection, and patcher.

Will get by default:

* JetBrainsMono

But you can specify which Nerd Fonts (plural) to get with `SSDF_NERD_FONTS`:

```bash
SSDF_NERD_FONTS="
CascadiaMono
InconsolataGo
"
```

To check if they've bee installed correctly:

```shell
fc-list| grep -i jetbrains
```

> _Note_: Might require a reboot.

To see if it's used in shell:

```shell
echo -e "\ue0b0 \uf015 \uf0e0 \uf15c"
```
