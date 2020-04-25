#!/bin/bash

set -e

# Parameters
recipe=${1:-default}

# Get ready
runlist="recipe[jarbas::osx_sudoers_nopass],recipe[jarbas::${recipe}],recipe[jarbas::osx_sudoers]"
json='{"jarbas":{"home": "'"${HOME}"'", "user":"'"${USER}"'"}}'
sudo -v
pushd $(dirname $(dirname $(realpath $0)))

# Berks update
if [ -f Berksfile.lock ]; then rm -rf Berksfile.lock; fi
berks install
berks vendor

# Run chef
echo ${json} | sudo chef-client -z -o "${runlist}" -j /dev/stdin --chef-license accept

# Tidy up
popd
