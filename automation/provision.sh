#!/bin/bash
ansible-playbook deploy.yaml -l oob,netq-ts
sleep 15
./netbox.py
ansible-playbook deploy.yaml -l network,servers
