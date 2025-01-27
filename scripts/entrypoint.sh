#!/bin/bash

# Exécuter le playbook Ansible
ansible-playbook -i /app/inventory/hosts /app/playbooks/hardening_checks.yml

# Garder le conteneur en vie (optionnel, pour débogage)
tail -f /dev/null