# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Configure web machine
  config.vm.define "gitlab" do |workspace|
    workspace.vm.box = "ubuntu/bionic64"
    workspace.vm.network "private_network", ip: "192.168.89.33"
    workspace.vm.synced_folder "./www/", "/var/www", id: "source"
    workspace.vm.synced_folder "./apache2/", "/etc/apache2/sites-enabled", owner: "root", group: "root", id: "vhost"
    workspace.vm.provision :shell do |shell|
      shell.args = ['app']
      shell.path = "provision/app.sh"
    end
     # Restart Apache2
    workspace.vm.provision "shell", run: "always", inline: "sudo a2enmod rewrite"
    workspace.vm.provision "shell", run: "always", inline: "/etc/init.d/apache2 restart"
  end

end
