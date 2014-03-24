#!/bin/bash
#
# Windows shell provisioner for Ansible playbooks, based on KSid's
# windows-vagrant-ansible: https://github.com/KSid/windows-vagrant-ansible
# and geerlingguy's JJG-Ansible-Windows https://github.com/geerlingguy/JJG-Ansible-Windows

ANSIBLE_PLAYBOOK=$1
ANSIBLE_HOSTS=$2
TEMP_HOSTS="/tmp/ansible_hosts"

if [ ! -f /ansible/$ANSIBLE_PLAYBOOK ]; then
  echo "Cannot find Ansible playbook."
  exit 1
fi

if [ ! -f /ansible/$ANSIBLE_HOSTS ]; then
  echo "Cannot find Ansible hosts."
  exit 2
fi

# Install Ansible and its dependencies if it's not installed already.
if [ ! -f /usr/bin/ansible ]; then
  echo "Installing Ansible dependencies and Git."
  apt-get install -y git python python-pip python-paramiko python-yaml python-jinja2 python-markupsafe
  echo "Installing Ansible."
  pip install ansible
fi

cp /ansible/${ANSIBLE_HOSTS} ${TEMP_HOSTS} && chmod -x ${TEMP_HOSTS}
echo "Running Ansible provisioner defined in Vagrantfile."
ansible-playbook /ansible/${ANSIBLE_PLAYBOOK} --inventory-file=${TEMP_HOSTS} --extra-vars "is_windows=true" --connection=local
rm ${TEMP_HOSTS}
