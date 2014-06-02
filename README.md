#Vagrant (LEMP)
##Updated for Ubuntu 14.04

This is the main vagrantfile, setup.sh and nginx server config I use in many of my projects. Just type `vagrant up` with the vagrantfile the project directory. It installs a LEMP stack (Ubuntu 14.04, nginx, MariaDB, PHP) as well as Composer, Laravel and Sass.

### Requirements ###
* Vagrant (1.6+)
* VirtualBox (4.2+)

*These are recommended requirements, this stack may work on earlier versions but is untested.*

### Installation ###
* Place the Vagrantfile in your project directory
* `cd` to your project directory, type `vagrant up`
* Wait for the virtualbox to be provisioned and deployed (may take a few minutes)
* Navigate to 127.0.0.1:4567 to see your newly provisioned VM

## Contributing

Please feel free to fork and contribute to this setup. It's not perfect by any means but works well for the small to medium sized projects I've needed. All contributions and suggestions are welcome.

## License

This repository is released as open-sourced software licensed under the [MIT license](http://opensource.org/licenses/MIT)
