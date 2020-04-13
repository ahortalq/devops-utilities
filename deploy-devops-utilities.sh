#!/bin/bash

cd /home/jcla/Projects/devops-utilities/playbooks
ansible-playbook app-devops-utilities.yml -e entorno=development --ask-sudo-pass
cd /home/jcla/Projects/devops-utilities
