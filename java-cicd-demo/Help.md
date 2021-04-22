# How to run ansible playbook using non root user

# Ansible CFG Format 
[defaults]
host_key_checking = False

# Location where ansible look for hosts
inventory = /etc/ansible/hosts

# Sample Playbook Format
------------------------------
- hosts: nilesh
  become: true
  become_user: root
  gather_facts: false
  tasks:
    - name: Install GIT package
      yum:
        name: git
        state: latest

------------------------------------------

ansible-playbook demo2.yml --user ctladmin --key-file /home/ctladmin/.ssh/id_rsa