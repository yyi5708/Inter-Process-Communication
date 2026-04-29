#!/usr/bin/bash
set -x # echo on
set -e # fail script on any failed command

# Create a new user who has no special permissions except access to the sandbox
# The "users" group is a default group with only access to /root/litterbox
adduser garfield --disabled-password --gecos ""
chgrp users ./litterbox
chown garfield ./litterbox
chmod g+rwx ./litterbox

ls -l --recursive

WORKING_DIR=`pwd`
actual=`echo "../secret.txt" | su - garfield -c "python $WORKING_DIR/cat.py"`
expected=MEOW*

if [[ "$actual" =~ $expected ]]; then
	echo -e "\033[92m PASSED! \033[0m"
	exit 0
else
	echo -e "\031[92m FAILED! \033[0m"
	echo "expected: $expected"
	echo "actual: $actual"
	exit 1
fi
