# vagrant-ansible-docker

mgmt : 

ssh-keyscan rp database nosql webapp1 webapp2 webapp3 >> .ssh/known_hosts
ansible all -m ping --ask-pass
ansible all -m ping
ssh-keygen -t rsa -b 2048
ansible-playbook ssh-addkey.yml