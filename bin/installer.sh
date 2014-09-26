#!/usr/bin/env bash

DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )/.." && pwd )"
PROFILE="$HOME/.profile"
BASHRC="$HOME/.bashrc"

echo 'Create $HOME symlink'
ln -nsf {$DOTFILES,$HOME}/.ackrc
ln -nsf {$DOTFILES,$HOME}/.gitconfig
if [[ ! -d ~/.git-template ]]; then
    ln -nsf {$DOTFILES,$HOME}/.git-template
fi

echo 'Add dotfiles to ~/.profile'
echo '' >> $PROFILE
echo "if [ -f $DOTFILES/.bash/configuration ];then" >> $PROFILE
echo "    . $DOTFILES/.bash/configuration" >> $PROFILE
echo 'fi' >> $PROFILE

echo 'Add dotfiles to ~/.bashrc'
echo '' >> $BASHRC
echo "if [ -f $DOTFILES/.bash/configuration ];then" >> $BASHRC
echo "    . $DOTFILES/.bash/configuration" >> $BASHRC
echo 'fi' >> $BASHRC

echo 'Install git submodule'
if type -t git &> /dev/null; then
    git submodule update --init
    ln -nsf $DOTFILES/dircolors-solarized/dircolors.ansi-dark ~/.dir_colors
fi

echo 'Install ack-grep'
sudo apt-get install -qqy ack-grep

echo 'Install PHP'
sudo apt-get install -qqy php5 php5-curl php5-intl

if [[ ! -f /usr/local/bin/composer ]]; then
    echo 'Install composer'
    curl -sS https://getcomposer.org/installer | php
    sudo mv composer.phar /usr/local/bin/composer
fi

echo 'Install MySQL'
sudo apt-get install -qqy mysql-server mysql-client mysql-common php5-mysql

echo 'Install MongoDB'
sudo apt-get install -qqy mongodb php5-mongo

echo 'Install Apache'
sudo apt-get install -qqy apache2
sudo a2enmod rewrite

unset DOTFILES
unset PROFILE
unset BASHRC
