#!/bin/bash

numPassed=0

./setup.sh

for testfile in testcases/*
do
	echo "Running $testfile"
	input=$(cat $testfile | sed -n '1p')
	expectedfile="expected/$(echo $testfile | sed -e 's/.*\///')"

	cd ..
	./run.py <<< "${input}" &> cs118-p2-testing/output
	cd cs118-p2-testing

	passed="f"
	for i in {1..20}
	do
		if ./contains_all.sh output "${expectedfile}"
		then
			echo "Pass"
			passed="t"
			break
		fi
		sleep 1
	done

	if [[ "${passed}" == "f" ]]
	then
		echo "Error with $testfile"
		echo "Output:"
		cat output
		echo "Expected:"
		cat "${expectedfile}"
	else
		let numPassed++
	fi
	let counter++
done
echo "Completed $numPassed/$counter tests"

