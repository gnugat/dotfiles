###
# Includes
###

# Aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# Custom configuration
for i in ~/.bash/*; do
    if [ -f $i ]; then
        . $i
    fi
done
unset i

# Custom functions
for i in ~/.bash/functions/*; do
  . $i
done
unset i

###
# Custom colors
###
if [[ `which dircolors` ]]; then
    if [ -f ~/.dir_colors ]; then
        eval `dircolors --bourne-shell ~/.dir_colors`
    fi
fi

###
# Shell options
###
shopt -s cdspell # Fix cd typos
shopt -s checkwinsize
shopt -s cmdhist # Log multi line commands
shopt -s expand_aliases # Replace aliases
shopt -s histappend # Append to history, instead of over writing
shopt -s nocaseglob # Case insensitive
