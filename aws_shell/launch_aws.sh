#!/bin/bash

polyorb_ready () {
    if [ -f ${POLYORB_CONF} ]; then
        local AWSHOST=$(grep -oP "\d+\.\d+\.\d+\.\d+" ${POLYORB_CONF})
        if nc -z $AWSHOST 2809 &> /dev/null; then
            return 0;
        else
            return 1;
        fi
    else
        return 1;
    fi
}

FAILCOUNT=0

until polyorb_ready || [ $FAILCOUNT -ge 10 ]; do
    FAILCOUNT=$(($FAILCOUNT + 1))
    echo "Waiting for PolyORB to start...";
    sleep 2;
done

if polyorb_ready; then
    aws_shell --aws_server_port 6080 --automatic-script-loading true
else
    echo "ERROR: PolyORB is not available"
    exit 1
fi
