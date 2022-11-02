# Ansible-Wordpress
Deploy Wordpress via Ansible

How to deploy:

First you have to install and configure ansible

1  sudo apt-add-repository ppa:ansible/ansible

2  sudo apt update

3  sudo apt install ansible

Then you have to generate ssh key on the Host machine and its public key into the control nodes authorized_keys file.

1  ssh-keygen

2  cat ~/.ssh/id_rsa.pub

3  ssh hostmachine@ipaddress

Then you have to add the host ip to ansible host file

sudo nano /etc/ansible/hosts
ansible all -m ping

edit the neccecary files and run the ansible code
