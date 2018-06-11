#!/bin/bash
cd vx-simulation
sed -i.bak 's/install-runner.yaml/install-runner-live.yaml/g' helper_scripts/auto_mgmt_network/OOB_Server_Config_auto_mgmt.sh
vagrant up oob-mgmt-server oob-mgmt-switch
vagrant up netq-ts
vagrant up leaf01 leaf02 leaf03 leaf04 spine01 spine02 server01 server02 server03 server04 server05 server06 exit01 exit02 super01 super02 edge01 edge02 rtr01 rtr02
