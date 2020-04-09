#!/bin/bash

pushd ../
if [ -f Berksfile.lock ]; then rm -rf Berksfile.lock; fi
berks install
berks vendor
popd
