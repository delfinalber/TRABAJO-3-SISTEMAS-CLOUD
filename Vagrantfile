# -*- mode: ruby -*-
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-22.04"
  config.vm.network "forwarded_port", guest: 80, host: 8080
   config.vm.network "private_network", ip: "192.168.33.10"
   config.vm.provider "virtualbox" do |vb|
     vb.memory = "1024"
   end
   config.vm.provision "shell", inline: <<-SHELL
		sudo apt-get update
   SHELL
  end
