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

echo 'Install Postgres'
sudo add-apt-repository "deb https://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" -y
wget --quiet -O - https://postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get install -qqy postgresql-9.6

echo 'Install PHP'
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -qq
sudo apt-get install -qqy php7.1 php7.1-curl php7.1-intl php7.1-pgsql php7.1-json php7.1-mbstring php7.1-zip php7.1-xml

if [[ ! -f /usr/local/bin/composer ]]; then
    echo 'Install composer'
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '544e09ee996cdf60ece3804abc52599c22b1f40f4323403c44d44fdfdd586475ca9813a858088ffbc1f233e9b180f061') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"
    sudo mv composer.phar /usr/local/bin/composer
fi

echo 'Install nginx'
sudo apt-add-repository ppa:nginx/development -y
sudo apt-get update -qq
sudo apt-get install -qqy nginx nginx-extras php7.1-fpm
sudo apt-get remove -qqy apache2

echo 'Install syntax highligthing for less'
sudo apt-get install -qqy source-highlight

echo 'Install vim (requires curl and python)'
sudo apt-get install -qqy vim curl python
curl -sL https://raw.githubusercontent.com/egalpin/apt-vim/master/install.sh | sh
source ~/.bashrc 
apt-vim install -y https://github.com/scrooloose/nerdtree.git
apt-vim install -y https://github.com/ctrlpvim/ctrlp.vim.git
apt-vim install -y https://github.com/tpope/vim-pathogen.git
apt-vim install -y https://github.com/shawncplus/phpcomplete.vim.git
apt-vim install -y https://github.com/ervandew/supertab.git
apt-vim install -y https://github.com/majutsushi/tagbar.git
apt-vim install -y https://github.com/SirVer/ultisnips.git
apt-vim install -y https://github.com/Shougo/unite.vim.git
apt-vim install -y https://github.com/sickill/vim-monokai.git
apt-vim install -y https://github.com/terryma/vim-multiple-cursors.git
apt-vim install -y https://github.com/vim-php/vim-php-refactoring.git
apt-vim install -y https://github.com/Shougo/vimproc.vim.git
apt-vim install -y https://github.com/lunaru/vim-twig.git

unset DOTFILES
unset PROFILE
unset BASHRC
