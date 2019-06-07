# Raymond

Chef repo to provision and configure workstations

# How to use

Use berks to download the dependent cookbooks. Only needs to be run on a clean setup or if cookbooks at source have changed.
```
berks vendor
```

Run chef to apply converge
```
chef-client -z -o 'role[workstation]' -E macbook
```

Or if you are lazy
```
berks vendor && chef-client -z -o 'role[workstation]' -E macbook
```

# Pre-requisites

* Git: You need to check stuff out somewhow
* chef-client: You need to run chef

Installing chef-client:
```
curl -L https://omnitruck.chef.io/install.sh | sudo bash
```
