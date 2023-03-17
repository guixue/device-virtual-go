#!/bin/bash
DIR=$PWD
CMD=../cmd/

# Kill all edgex-ui-go* stuff
function cleanup {
	pkill device-virtual
}

cd $CMD
exec -a device-virtual ./device-virtual -cp=consul.http://localhost:8500 -registry &
cd $DIR

trap cleanup EXIT

while : ; do sleep 1 ; done
