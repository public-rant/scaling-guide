#!/bin/bash
cd $(dirname "$0")
set -e -o pipefail
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "greeting" [ $(cat /usr/local/etc/greeting.txt | grep hey) ]

git clone git@github.com:public-rant/videos playwright-examples
pushd playwright-examples
npm install
npx playwright install --with-deps chromium
check "playwright-list" npx playwright test --list --reporter json | grep specs
popd

# Report result
reportResults
