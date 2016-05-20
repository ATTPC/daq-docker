#!/bin/bash

rclog_ready () {
    nc -z $RCLOG_HOST $RCLOG_PORT &> /dev/null
}

rcc_ready () {
    nc -z localhost $RCC_PORT
}

# Check if experiment name is set
if [ -z $RCC_EXPERIMENT_NAME ]; then
    echo "Must set RCC_EXPERIMENT_NAME to the current experiment name"
    exit 1
fi

# Need to override RCC_HOST on this machine so CreateExperiment can connect
RCC_HOST=$(hostname)

RCC_SAVE_PATH=${EXP_DIR}/${RCC_EXPERIMENT_NAME}
mkdir -p $RCC_SAVE_PATH

FAILCOUNT=0
until rclog_ready || [ $FAILCOUNT -ge 10 ]; do
    FAILCOUNT=$(($FAILCOUNT + 1))
    echo "Waiting for RCLOG to start..."
    sleep 2
done

if ! rclog_ready; then
    echo "RCLOG is not running"
    exit 1
fi

# Launch RCC in background
java -cp ${RCC_EXE}/..:${RCC_EXE}/../log4j-1.3alpha-7.jar RunControlServer &
RCCPID=$!

FAILCOUNT=0
until rcc_ready || [ $FAILCOUNT -ge 10 ]; do
    FAILCOUNT=$(($FAILCOUNT + 1))
    echo "Waiting for RCC to start..."
    sleep 2
done

if ! rcc_ready; then
    echo "RCC is not running"
    exit 1
fi

CreateExperiment ${RCC_EXPERIMENT_NAME} ${RCC_SAVE_PATH}

wait $RCCPID
