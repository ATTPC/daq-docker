#!/bin/bash
set -e

POLYORB_CMD="po_cos_naming --polyorb-iiop-polyorb-protocols-iiop-default_port=2809"

# Set up the narval.conf file
${POLYORB_CMD} | grep corbaloc \
    | sed s/POLYORB_CORBA_NAME_SERVICE/\[dsa\]\\nname_service/ \
    > ${POLYORB_CONF} & sleep 1 && killall -9 po_cos_naming

po_cos_naming --polyorb-iiop-polyorb-protocols-iiop-default_port=2809
