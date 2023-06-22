#!/usr/bin/env bash

red=$(tput setaf 1)
none=$(tput sgr0)

show_help() {
    printf "usage: $0 [--help] [--report] [--test] [<path to package>]

Script for running all unit and widget tests with code coverage.
(run from root of repo)

where:
    <path to package>
        runs all tests with coverage and reports
    -t, --test
        runs all tests with coverage, but no report
    -r, --report
        generate a coverage report
        (requires lcov, install with Homebrew)
    -h, --help
        print this message
"
}

run_tests() {
    if [[ -f "pubspec.yaml" ]]; then
        rm -f coverage/lcov.info
        rm -f coverage/lcov-final.info
        flutter test --coverage
    else
        printf "\n${red}Error: this is not a Flutter project${none}"
        exit 1
    fi
}

run_report() {
    if [[ -f "coverage/lcov.info" ]]; then
        lcov --remove coverage/lcov.info 'lib/src/models/*'
        genhtml coverage/lcov.info -o coverage/html
        open coverage/html/index.html
    else
        printf "\n${red}Error: no coverage info was generated${none}"
        exit 1
    fi
}

case $1 in
    -h|--help)
        show_help
        ;;
    -t|--test)
        run_tests
        ;;
    -r|--report)
        run_report
        ;;
    *)
        run_tests
        run_report
        ;;
esac