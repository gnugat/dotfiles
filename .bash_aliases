## Common bash function

# Allows to sudo an alias
alias sudo="sudo "

# Listing
alias ls="ls --color"
alias l="ls --color"
alias la="ls -a --color"
alias ll="ls -l --color"
alias lla="ls -la --color"

# Interractive mode
alias cp="cp -i"
alias mv="mv -i"

# Search
alias grep='grep --exclude-dir ".svn" --exclude-dir ".git" --exclude tagsi --color=tty'
alias ack="ack-grep"
alias sed="sed --follow-symlinks"

## Services
alias mysql="mysql --sigint-ignore"

## Symfony
alias sf='php app/console'
alias sfc='php app/console cache:clear'
alias sft='php bin/vendor/phpunit -c app'
alias sfs='php bin/vendor/phpspec --config=app/phpspec.yml.dist run'
alias sfd='php bin/vendor/phpspec --config=app/phpspec.yml.dist describe'
