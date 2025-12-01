#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "greeting" [ $(cat /usr/local/etc/greeting.txt | grep goodbye) ]

# Report result
reportResults
