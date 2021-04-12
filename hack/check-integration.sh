#!/bin/sh
set -o errexit
set -u

command="python"

check_all_tests_on_dir(){
    dir=$1
    tests=$(find $dir -name "*.py")
    echo "Running tests on dir: "$dir
    for test_file in $tests; do
        echo "Running test: "$test_file
        $command $test_file;
    done
}

check_specific_test(){
    cmd="$command ./tests/unit/$@"
    echo "Running: "$cmd
    $cmd
}

check_coverage(){
    echo "Erasing older coverage tests..."
    coverage erase
    command="coverage run --parallel-mode"
    check_all_tests_on_dir "./tests/unit"
    echo "Combining coverage tests..."
    coverage combine
    echo "Reporting..."
    coverage report
    echo "Generating 'test/coverage/index.html'..."
    coverage html --directory=./tests/coverage
    echo "Coverage tests has finished!"
}

check_parameters(){
    case $@ in
	"--coverage")
	    check_coverage
	    ;;
	*)
	    check_specific_test $@
	    ;;
    esac
}

if [ $# -ne 0 ];
then
   check_parameters $@
else
   check_all_tests_on_dir "./tests/integration"
fi
