# -*- mode: ruby -*-
# vi: set ft=ruby :

# This Vagrantfile is used to configure AcnTech's Development Environment
# Maintainer: Fredrik Bjørnøy "fredrik.bjornoy@accenture.com"

Vagrant.configure(2) do |config|

  # Using AcnTech's ubuntu image
  config.vm.box = "acntech/ubuntu64"

  # Synced folders
  config.vm.synced_folder "puppet/modules", "/puppet"
 
  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true
  
     # Customize the amount of memory on the VM:
     vb.memory = "1024"

     # Name to display in Virtualbox
     vb.name = "AcnTech Development Environment"
   end
  
  # Provisioning TODO: Seems to be in conflict with ubuntu's own check at startup
  #config.vm.provision "shell", inline: "apt-get update --fix-missing"

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
