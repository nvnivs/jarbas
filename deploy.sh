#!/bin/bash

set -e
sudo whoami >/dev/null
berks install
berks update
berks vendor
sudo chef-client -z -o 'role[workstation]' -j .chef/node.json
