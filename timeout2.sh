#!/bin/bash
ssh -o  UserKnownHostsFile=/dev/null -o  "stricthostkeychecking no" -p 2024 -i /home/ansible/cloud_ats.key root@10.34.224.112 ' tail -f /var/log/sonus/lca/lca.log | while read LOGLINE
do
   [[ "${LOGLINE}" == *"SBC service is now running"* ]] && pkill -P $$ tail
done    
'
