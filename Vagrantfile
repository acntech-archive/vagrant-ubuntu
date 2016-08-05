# -*- mode: ruby -*-
# vi: set ft=ruby :

# This Vagrantfile is used to configure AcnTech's Development Environment
# Maintainer: Fredrik Bjørnøy "fredrik.bjornoy@accenture.com"

Vagrant.configure(2) do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "accenture/ubuntu64"

  # Synced folders
  config.vm.synced_folder "puppet/modules", "/puppet"
 
  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false # TODO: Under test trengs ikke dette foreløpig, skru på igjen
  
     # Customize the amount of memory on the VM:
     vb.memory = "1024"

     # Name to display in Virtualbox
     vb.name = "AcnTech Development Environment"
   end
  
  # Provisioning
  config.vm.provision "shell", inline: "apt-get update --fix-missing"

  # Installing docker on guest
  config.vm.provision "docker"

  # Enable provisioning with puppet
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
    puppet.manifest_file = "init.pp"
    puppet.module_path = "puppet/modules"
    puppet.options = "--verbose --debug"
 end
  
end
