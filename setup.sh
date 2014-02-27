#!/usr/bin/env bash

echo "### Setup provisioning started"
echo "### Updating package list (this will take a few minutes)"
echo "### Remove -qq in setup.sh to see the full output"
sudo apt-get -qq update

echo "### Add mariadb to packages"
sudo apt-get -qq install python-software-properties
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://mirrors.coreix.net/mariadb/repo/10.0/ubuntu precise main'

echo "### Updating package list AGAIN (this will take a few minutes)"
echo "### Remove -qq in setup.sh to see the full output"
sudo apt-get -qq update

echo "### Create temp folder to work from"
mkdir /temp
cd /temp

echo "### Install web packages"
sudo apt-get -qq install build-essential nginx php5-fpm php-pear php5-cli php5-gd php5-curl php5-common php5-mysql php-apc php-console-table libmcrypt4 php5-mcrypt php5-memcached php5-json

echo "### Set up nginx"
wget https://raw.github.com/jamieshepherd/vagrant/master/setup.sh
sudo cp default /etc/nginx/sites-available/default

echo "### Install mariadb"
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password password'
sudo apt-get -y install mariadb-server

echo "### Install composer"
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer

echo "### Install laravel PHAR archive"
wget http://laravel.com/laravel.phar
sudo cp laravel.phar /usr/local/bin/laravel

echo "### Set permissions"
sudo chmod -R 777 /vagrant

echo "### Tidy and reboot"
cd ~
rm -rf /temp
sudo reboot

echo "### That's it, we're done!"