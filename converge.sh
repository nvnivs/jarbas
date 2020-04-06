#!/bin/bash

set -e
recipe=${1:-default}
runlist="recipe[jrb_workstation::osx_sudoers_nopass],recipe[jrb_workstation::${recipe}],recipe[jrb_workstation::osx_sudoers]"
json='{"jrb_workstation":{"home": "'"${HOME}"'", "user":"'"${USER}"'"}}'
sudo -v
if [ -f Berksfile.lock ]; then rm -rf Berksfile.lock; fi
berks install
berks vendor
echo ${json} | sudo chef-client -z -o "${runlist}" -j /dev/stdin --chef-license accept
