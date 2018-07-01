#!/bin/bash
ansible-playbook deploy.yaml -l oob,netq-ts
sleep 30 
./netbox.py
ansible-playbook deploy.yaml -l network,servers
