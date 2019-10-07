#!/bin/bash 

ssh -o  "stricthostkeychecking no" -p 2024 -i /home/ansible/cloud_ats.key root@10.34.224.114 " FILE_TO_CHECK="/var/log/sonus/lca/lca.log"
  LINE_TO_CONTAIN="SBC service is now running"
  SLEEP_TIME=10
  COUNT=0
  MAX=10
  while [ $(cat FILE_TO_CHECK | grep "${LINE_TO_CONTAIN}") -a ${COUNT} -lt ${MAX} ]
  do
      sleep ${SLEEP_TIME}
      COUNT=$(($COUNT + 1))
  done

  if [  $(cat FILE_TO_CHECK | grep "${LINE_TO_CONTAIN}") ]
  then
    echo "Let's go, the file is containing what we want"
    # Start your algorithm here
  else
    echo "Timed out"
    exit 10
  fi "
