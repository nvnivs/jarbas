#!/bin/bash

recipe=${1:-default}
pushd pushd $(dirname $(dirname $(realpath $0)))
runlist="recipe[jrb_workstation::osx_sudoers_nopass],recipe[jrb_workstation::${recipe}],recipe[jrb_workstation::osx_sudoers]"
json='{"jrb_workstation":{"home": "'"${HOME}"'", "user":"'"${USER}"'"}}'
sudo -v
echo ${json} | sudo chef-client -z -o "${runlist}" -j /dev/stdin --chef-license accept
popd
