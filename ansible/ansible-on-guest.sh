#!/bin/bash

# Copy resolv.conf (prevent dns problems)
cp -f /vagrant/vagrant-php/ansible/resolv.conf /etc/resolv.conf

# add repository with ansible
rpm -iUvh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm > /dev/null 2>&1

# add key
rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 > /dev/null 2>&1

# Update apt information
yum -y update > /dev/null 2>&1

# Install ansible, https support for apt
yum -y install ansible > /dev/null 2>&1

export PYTHONUNBUFFERED=1

# Run the playbook.
echo "Running Ansible provisioner defined in Vagrantfile."
echo "extra-vars: " $2
ansible-playbook -i localhost, --connection=local --extra-vars=${2} /vagrant/vagrant-php/${1}
