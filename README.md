# jarbas

A rather opinionated cookbook to provision and configure workstations

## Pre-requisites

* `git`: To checkout the repo
* `chef-dk`: Need chef-client and chef

## How to use

Run the converge script to execute the entire setup

    $ ./bin/converge.sh

After the first setup, `converge.sh` is aliased to `j`, so the above can be used as

    $ j brew

## Custom attributes

Node attributes are set on `${HOME}/.jarbas.json`. This file will be created on the first run if not found.

To run additional recipes override `jarbas['recipes']` with a list of any recipes you want to run on the node.

## Testing

### Unit

RSpec is used for unit tests. 

    $ chef exec rspec

### Integration

Test kitchen is used for integration tests. 

    $ kitchen test
 