#!/bin/sh
set -o errexit
set -u

command="pylint "

check_all_tests_on_dir(){
    dir=$1
    tests=$(find $dir -name "*.py")
    echo "Running tests on dir: "$dir
    for test_file in $tests; do
        echo "Running test: "$test_file
        $command $test_file;
    done
}

check_all_tests_on_dir "./"

