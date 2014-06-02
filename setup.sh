#!/usr/bin/env bash

echo "### Setup provisioning started"
sudo apt-get install python-software-properties

echo "### Add mariadb to packages"
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://mirrors.coreix.net/mariadb/repo/10.0/ubuntu trusty main'

echo "### Updating package list"
sudo apt-get -qq update

echo "### Create temp folder to work from"
sudo mkdir /temp
cd /temp

echo "### Install web packages"
sudo apt-get -qq install build-essential nginx php5-fpm php-pear php5-cli php5-gd php5-curl php5-common php5-mysql php-apc php-console-table libmcrypt4 php5-mcrypt php5-memcached php5-json curl ruby

echo "### Set up nginx"
sudo wget https://raw.github.com/jamieshepherd/Vagrant-LEMP/master/default
sudo wget https://raw.github.com/jamieshepherd/Vagrant-LEMP/master/nginx.conf
sudo cp default /etc/nginx/sites-available/default
sudo cp nginx.conf /etc/nginx/nginx.conf

echo "### Install mariadb"
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password password password'
sudo debconf-set-selections <<< 'mariadb-server-10.0 mysql-server/root_password_again password password'
sudo apt-get -y install mariadb-server

echo "### Install composer"
curl -sS https://getcomposer.org/installer | sudo php
sudo mv composer.phar /usr/local/bin/composer

echo "### Install laravel PHAR archive"
sudo wget http://laravel.com/laravel.phar
sudo cp laravel.phar /usr/local/bin/laravel

echo "### Installing Sass"
sudo gem install sass

echo "### Set permissions"
sudo chmod -R 777 /vagrant
sudo chmod -R 777 /usr/local/bin/laravel

echo "### Enable mcrypt"
sudo php5enmod mcrypt
sudo restart php5-fpm

echo "### Tidy and reboot"
cd ~
sudo rm -rf /temp

echo "### That's it, we're done! Get working!"
