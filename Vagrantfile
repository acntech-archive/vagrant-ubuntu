# -*- mode: ruby -*-
# vi: set ft=ruby :

# This Vagrantfile is used to configure AcnTech's Development Environment
# Maintainer: Fredrik Bjørnøy "fredrik.bjornoy@accenture.com"

Vagrant.configure(2) do |config|

  # Using AcnTech's ubuntu image
  config.vm.box = "acntech/ubuntu64"

  config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = true

     # Customize the amount of memory on the VM
     vb.memory = "3000"

     # Name to display in Virtualbox
     vb.name = "AcnTech Development Environment"
   end

  # Enable provisioning with puppet
  config.vm.provision "puppet" do |puppet|
    puppet.environment_path = "puppet/environments"
    puppet.environment = "dev"
    puppet.module_path = "puppet/modules"
    puppet.options = "--verbose --debug"
 end

 # Update packages
 config.vm.provision "shell", inline: "apt-get -y update"

 # Make sure IntelliJ dekstop icon is present
 config.vm.provision "file", source: "puppet/modules/intellij/files/intellij.desktop", destination: "~/.local/share/applications/intellij.desktop"

end
