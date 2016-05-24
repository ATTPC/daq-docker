#!/bin/bash
set -e

POLYORB_CMD="po_cos_naming --polyorb-iiop-polyorb-protocols-iiop-default_port=2809"

service sshd start 

# Set up the narval.conf file
${POLYORB_CMD} | grep corbaloc \
    | sed s/POLYORB_CORBA_NAME_SERVICE/\[dsa\]\\nname_service/ \
    > ${POLYORB_CONF} & sleep 1 && killall -9 po_cos_naming

po_cos_naming --polyorb-iiop-polyorb-protocols-iiop-default_port=2809 & POLYORB_PID=$!

narval_naming_service & NAMING_PID=$1

central_log --log_level debug --port ${RCLOG_PORT} --name central_log --wait_time 100 --server ${RCLOG_HOST} &

aws_shell --aws_server_port 6080 --automatic-script-loading true & AWS_PID=$!

wait
