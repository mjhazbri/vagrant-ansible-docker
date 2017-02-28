# Defines our Vagrant environment
#
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # create mgmt node
  config.vm.define :mgmt do |mgmt_config|
      mgmt_config.vm.box = "ubuntu/trusty64"
      mgmt_config.vm.hostname = "mgmt"
      mgmt_config.vm.network :private_network, ip: "192.168.1.2"
      mgmt_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
      mgmt_config.vm.provision :shell, path: "install-tools-mgmt.sh"
  end

  # create reverse proxy
  config.vm.define :rp do |rp_config|
      rp_config.vm.box = "ubuntu/trusty64"
      rp_config.vm.hostname = "rp"
      rp_config.vm.network :private_network, ip: "192.168.1.3"
      rp_config.vm.network "forwarded_port", guest: 80, host: 80
      rp_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end
  
  # create mysql db
  config.vm.define :database do |database_config|
      database_config.vm.box = "ubuntu/trusty64"
      database_config.vm.hostname = "database"
      database_config.vm.network :private_network, ip: "192.168.1.4"
      database_config.vm.network "forwarded_port", guest: 3306, host: 3306
      database_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end
  
  # create nosql database node
  config.vm.define :nosql do |nosql_config|
      nosql_config.vm.box = "ubuntu/trusty64"
      nosql_config.vm.hostname = "nosql"
      nosql_config.vm.network :private_network, ip: "192.168.1.5"
      nosql_config.vm.network "forwarded_port", guest: 27018, host: 27018
      nosql_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end
  
  # create Jenkins node
  config.vm.define :jenkins do |jenkins_config|
      jenkins_config.vm.box = "ubuntu/trusty64"
      jenkins_config.vm.hostname = "jenkins"
      jenkins_config.vm.network :private_network, ip: "192.168.1.6"
      jenkins_config.vm.network "forwarded_port", guest: 8080, host: 8080
      jenkins_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end

  # create Sonar node
  config.vm.define :sonar do |sonar_config|
      sonar_config.vm.box = "ubuntu/trusty64"
      sonar_config.vm.hostname = "sonar"
      sonar_config.vm.network :private_network, ip: "192.168.1.7"
      sonar_config.vm.network "forwarded_port", guest: 8080, host: 8080
      sonar_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end
  # create nexus node
  config.vm.define :nexus do |nexus_config|
      nexus_config.vm.box = "ubuntu/trusty64"
      nexus_config.vm.hostname = "nexus"
      nexus_config.vm.network :private_network, ip: "192.168.1.8"
      nexus_config.vm.network "forwarded_port", guest: 8080, host: 8080
      nexus_config.vm.provider "virtualbox" do |vb|
        vb.memory = "512"
      end
  end
  
  # create some web application servers
  # https://docs.vagrantup.com/v2/vagrantfile/tips.html
  (1..3).each do |i|
    config.vm.define "webapp#{i}" do |node|
        node.vm.box = "ubuntu/trusty64"
        node.vm.hostname = "webapp#{i}"
        node.vm.network :private_network, ip: "192.168.1.2#{i}"
        node.vm.network "forwarded_port", guest: 8080, host: "8#{i}"
        node.vm.provider "virtualbox" do |vb|
          vb.memory = "512"
        end
    end
  end

end
