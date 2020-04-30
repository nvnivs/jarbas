#!/bin/bash

set -e

pushd $(dirname $(dirname $(realpath $0)))

if [ -f Berksfile.lock ]; then rm -rf Berksfile.lock; fi
berks install
berks vendor
rm -rf berks-cookbooks/jarbas
ln -s ../cookbooks/jarbas berks-cookbooks/jarbas
popd
