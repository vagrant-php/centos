#!/bin/bash

# Copy resolv.conf (prevent dns problems)
cp -f /vagrant/vagrant-php/ansible/resolv.conf /etc/resolv.conf

# add repository with ansible
yum install -y epel-release > /dev/null 2>&1

# install ansible
yum install -y ansible > /dev/null 2>&1

export PYTHONUNBUFFERED=1

# Run the playbook.
echo "Running Ansible provisioner defined in Vagrantfile."
echo "extra-vars: " $2
ansible-playbook -i localhost, --connection=local --extra-vars=${2} /vagrant/vagrant-php/${1}
