# jarbas

A rather opinionated Chef repo to provision and configure workstations

## Pre-requisites

* `git`: To checkout the repo
* `chef-dk`: Need chef-client and berkshelf

## How to use

Run the converge script to execute the entire setup

    $ ./bin/converge.sh

Alternatively pass a single recipe as a parameter

    $ ./bin/converge.sh brew

After the first setup, `converge.sh` is aliased to `j`, so the above can be used as

    $ j brew

