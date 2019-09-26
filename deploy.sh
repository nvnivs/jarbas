#!/bin/bash

set -e
recipe=${1:-default}
runlist="recipe[jrb_workstation::osx-sudoers-nopass],recipe[jrb_workstation::${recipe}],recipe[jrb_workstation::osx-sudoers]"
sudo -v
berks install
berks update
berks vendor
sudo chef-client -z -o "${runlist}" -j .chef/node.json
