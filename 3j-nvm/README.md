# 🚦 nvm

Node Version Manager.

```console
# Install
nvm install node # "node" is an alias for the latest version
nvm install 14.7.0 # or 16.3.0, 12.22.1, etc

# Use
nvm use node # use latest installed version
nvm use 16 # use eg v16.9.1

# Checking
node -v # check currently used version
nvm ls # check installed node versions
nvm ls-remote # check available node versions

# Uninstall
nvm uninstall v14.7.0 # uninstall specific node version
nvm unload; rm -rf ~/.config/nvm # uninstall nvm
```
