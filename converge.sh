#!/bin/bash

set -e
recipe=${1:-default}
runlist="recipe[jrb_workstation::osx-sudoers-nopass],recipe[jrb_workstation::${recipe}],recipe[jrb_workstation::osx-sudoers]"
sudo -v
if [ -f Berksfile.lock ]; then rm -rf Berksfile.lock; fi
berks install
berks vendor
sudo chef-client -z -o "${runlist}" -j .chef/node.json
