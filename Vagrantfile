VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
    # Use Ubuntu 14.04
    config.vm.box = "ubuntu/trusty32"
    # Use port 4567 (http://127.0.0.1:4567)
    config.vm.network :forwarded_port, host: 4567, guest: 80
    # Set up provision
    config.vm.provision :shell, :path => "https://raw.github.com/jamieshepherd/Vagrant-LEMP/master/setup.sh"
end
