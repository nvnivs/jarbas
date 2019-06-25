# jarbas

Chef repo to provision and configure workstations

# How to use

Use berks to download the dependent cookbooks. Only needs to be run on a clean setup or if cookbooks at source have changed.

    berks vendor

Run chef to apply converge

    sudo chef-client -z -o 'role[workstation]' -E macbook

Or if you are lazy

    berks vendor && sudo chef-client -z -o 'role[workstation]' -E macbook -j .chef/node.json

# Pre-requisites

* Git: You need to check stuff out somewhow
* ChefDK: You need chef, you need berkshelf

Installing chef-client:

    curl -L https://omnitruck.chef.io/install.sh | sudo bash

# Git config

To use custom cred for commits to this repo set the following in `.git/config`

    [credential]
        helper=
    [user]
	    name = your name
	    email = your@email.com
