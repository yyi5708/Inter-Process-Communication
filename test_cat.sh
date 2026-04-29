#!/usr/bin/bash
set -x # echo on
set -e # fail script on any failed command

actual=`echo "treasure.txt" | python cat.py`
expected="Treasure found!"

if [ "$actual" = "$expected" ]; then
	echo -e "\033[92m PASSED! \033[0m"
	exit 0
else
	echo -e "\031[92m FAILED! \033[0m"
	echo "expected: $expected"
	echo "actual: $actual"
	exit 1
fi
