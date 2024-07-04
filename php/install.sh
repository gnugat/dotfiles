#!/usr/bin/env bash

_PHP_DOTFILES="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '// Installing PHP...'

sudo apt install -qqy php8.3 php8.3-curl php8.3-intl php8.3-mbstring php8.3-zip php8.3-xml apache2- apache2-bin-
sudo mkdir -p /etc/php/conf.d
sudo ln -nsf $_PHP_DOTFILES/config.ini /etc/php/conf.d/user.ini
sudo ln -nsf /etc/php/conf.d/user.ini /etc/php/8.3/cli/conf.d/42-user.ini
sudo ln -nsf /etc/php/conf.d/user.ini /etc/php/8.3/fpm/conf.d/42-user.ini

curl -sS https://getcomposer.org/installer | php > /dev/null
sudo mv composer.phar /usr/local/bin/composer

unset _PHP_DOTFILES

echo ' '
echo ' [OK] PHP installed'
echo ' '
