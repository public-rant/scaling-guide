#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "greeting" [ $(cat /usr/local/etc/greeting.txt | grep hey) ]

git clone https://github.com/microsoft/playwright-examples
pushd playwright-examples
npm install
npx playwright install --with-deps chromium
check "playwright-list" npx playwright test --project chromium --list --reporter json | grep specs
popd

# Report result
reportResults
