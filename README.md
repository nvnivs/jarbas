# jarbas

A rather opinionated Chef repo to provision and configure workstations

## How to use

Run the converge script to execute the entire setup

    $ ./bin/converge.sh

Alternatively pass a single recipe as a parameter

    $ ./bin/converge.sh brew

After the first setup, `converge.sh` is aliased to `j`, so the above can be used as

    $ j brew

## Pre-requisites

* Git: You need to check stuff out somewhow
* ChefDK: You need chef, you need berkshelf

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

    Import manually

* Rvm doesnt reload the profile after install

    Open new terminal

* rvm install ruby-1.9.3-p551 fails with "$LANG was empty, setting up LANG=en_US.US-ASCII, if it fails again try setting LANG to something sane and try again."

    export LANG=en_US.US-ASCII

* rvm set default is not saving the default

* iterm does not copy all the settings
