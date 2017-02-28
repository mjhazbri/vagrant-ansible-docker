#!/usr/bin/env bash

# install ansible (http://docs.ansible.com/intro_installation.html)
apt-get -y install software-properties-common
apt-add-repository -y ppa:ansible/ansible
apt-get update
apt-get -y install ansible

# copy ansible file into /home/vagrant (from inside the mgmt node)
cp -a /vagrant/ansible/* /home/vagrant
chown -R vagrant:vagrant /home/vagrant

# configure hosts file for our internal network defined by Vagrantfile
cat >> /etc/hosts <<EOL

# vagrant environment nodes
192.168.1.2  mgmt
192.168.1.3  rp
192.168.1.4  database
192.168.1.5  nosql
192.168.1.6  jenkins
192.168.1.7  sonar
192.168.1.8  nexus
192.168.1.21  webapp1
192.168.1.22  webapp2
192.168.1.23  webapp3
EOL
