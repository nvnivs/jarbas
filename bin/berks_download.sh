#!/bin/bash

pushd $(dirname $(dirname $(realpath $0)))
if [ -f Berksfile.lock ]; then rm -rf Berksfile.lock; fi
berks install
berks vendor
popd
