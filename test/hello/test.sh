#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "greeting" [ $(cat /usr/local/etc/greeting.txt | grep hey) ]

pushd /workspaces/videos
check "playwright-list" npx playwright test --list --reporter json | grep specs
popd

# Report result
reportResults
