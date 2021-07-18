#!/bin/bash

#Install ansible
apt-get update
apt-get install ansible

#Install apps via ansible
ansible-playbook demo_abb/playbooks/xfce.yml
ansible-playbook demo_abb/playbooks/chromium.yml
ansible-playbook demo_abb/playbooks/docker.yml
ansible-playbook demo_abb/playbooks/docker-compose.yml

#Launch docker containers
sh demo_abb/scripts/dockerlaunch.sh
