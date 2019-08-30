# jarbas

Chef repo to provision and configure workstations

## How to use

Use berks to download the dependent cookbooks. Only needs to be run on a clean setup or if cookbooks at source have changed.

    berks vendor

Run chef to apply converge

    sudo chef-client -z -o 'role[workstation]' -E macbook

Or if you are lazy

    berks vendor && sudo chef-client -z -o 'role[workstation]' -E macbook -j .chef/node.json

## Pre-requisites

* Git: You need to check stuff out somewhow
* ChefDK: You need chef, you need berkshelf

Installing chef-client:

    curl -L https://omnitruck.chef.io/install.sh | sudo bash

## Git config

To use custom cred for commits to this repo set the following in `.git/config`

    [credential]
        helper=
    [user]
	    name = your name
	    email = your@email.com

## Setup on a new mac book

1. Install xcode from apple store
2. Download and install Chef DK https://downloads.chef.io/chefdk

## Known issues

* Rvm cant set localle

    export LC_ALL=en_US.UTF-8

* Rvm cant import key

    sudo whoami && berks vendor && berks update && sudo chef-client -z -o 'role[workstation]' -E macbook -L /tmp/chef-client.log§

* Rvm doesnt reload the profile after install

    Open new terminal

* Berks needs to vendor after upgrade

    command needs to be run twice

* rvm install ruby-1.9.3-p551 fails with "$LANG was empty, setting up LANG=en_US.US-ASCII, if it fails again try setting LANG to something sane and try again."

    export LANG=en_US.US-ASCII

* gem install encrypt_data_bag fails with wrong ruby version

    rvm use ruby-2.5.5
