#!/bin/bash

# $1: program output
# $2: check file
if [ ! -f "${1}" ] || [ ! -f "${2}" ]
then
	exit 1
fi

IFS=$'\n'
for line in $(cat "${2}")
do
	if ! cat "${1}" | grep -q "${line}"
	then
		exit 1
	fi
done

exit 0
