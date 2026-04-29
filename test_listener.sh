#!/bin/bash
set -x # echo on
set -e # fail script on any failed command

./listener > output.log & # fire off listener in the background
LISTENER_PID=$!
echo -e "Listener PID: $LISTENER_PID"

sleep 1 # give it a moment to start up

kill -s USR1 $LISTENER_PID

actual=`cat output.log`
expected="SIGUSR1 received!*"

if [[ $actual =~ $expected ]]; then
	echo -e "\033[92m PASSED! \033[0m"
	exit 0
else
	echo -e "\031[92m FAILED! \033[0m"
	echo "expected: $expected"
	echo "actual: $actual"
	exit 1
fi
