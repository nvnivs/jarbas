# Version for a brew cask version of vagrant
default['jrb_workstation']['vagrant']['version_sha'] = '687a8a9145b055886413ed8edbb5632ee0830c8e'

default['jrb_workstation']['vagrant']['plugins'] = [
  'vagrant-berkshelf',
  'vagrant-omnibus',
  'vagrant-vbguest'
]
