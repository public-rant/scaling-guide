#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "greeting" [ $(cat /usr/local/etc/greeting.txt | grep hey) ]

git clone https://github.com/public-rant/videos.git /workspaces/videos
pushd /workspaces/videos
npm install
npx playwright install --with-deps
check "playwright-list" npx playwright test --list --reporter json | grep specs
popd

# Report result
reportResults
