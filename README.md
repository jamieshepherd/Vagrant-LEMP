Vagrant (LEMP)
==============

This is the main vagrantfile, setup.sh and nginx server config I use in many of my projects. Just type **vagrant up** with the vagrantfile the project directory. It installs a LEMP stack (Linux, Nginx, MariaDB, PHP) as well as composer and laravel.

### Requirements ###
* Vagrant
* VirtualBox (4.2+)

### Installation ###
* Download the repository
* Place the Vagrantfile in your project directory
* If you don't have a precise32 box, install one first
* cd into your project directory, and type **vagrant up**
* Wait for the virtualbox to be deployed (this could take a couple minutes)
* Navigate to 127.0.0.1:4567 to see your provisioned vagrant VM

### Troubleshooting ###
* Obviously, an internet connection is needed to install vagrant + provisions
* If the address at 127.0.0.1:4567 does not work immediately, try restarting the vagrant machine (**vagrant halt** followed by **vagrant up**) - This sometimes happens if ports are in use, but is generally cleared by a reset