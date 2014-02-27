vagrant
=======

This is the main vagrantfile, setup.sh and nginx server config I use in many of my projects. Just type **vagrant up** from your project directory with the vagrantfile and setup.sh in the same directory.

### Requirements ###
* Vagrant
* VirtualBox (4.2+)

### Installation ###
* Download the repository
* Place both Vagrantfile and setup.sh in your project directory
* If you don't have a precise32 box, install one first
* cd into your project directory, and type **vagrant up**
* Wait for the virtualbox to be deployed (this could take a couple minutes)
* When finished, reload the box (or **vagrant halt** and **vagrant up** again)
* Navigate to 127.0.0.1:4567 to see your provisioned vagrant VM

### Known issues ###
* The working directory will not mirror on the first **vagrant up** - you must reboot the first time.
