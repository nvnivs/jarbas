#!/bin/bash

set -e
if [ -z "${1}" ]; then
    runlist='role[workstation]'
else
    runlist="recipe[jrb_workstation::osx-sudoers-nopass],recipe[jrb_workstation::${1}],recipe[jrb_workstation::osx-sudoers]"
fi
sudo whoami >/dev/null
berks install
berks update
berks vendor
sudo chef-client -z -o "${runlist}" -j .chef/node.json
