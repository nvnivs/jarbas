default['jrb_workstation']['vagrant']['version'] = '2.2.4'
default['jrb_workstation']['vagrant']['checksum'] = 'a09a2f0fb3fcbd4cfb41c7812c01605173f64056449c3dbcc513b4211e9c1e8d'


# Version for a brew cask version of vagrant
default['jrb_workstation']['vagrant']['version_sha'] = '687a8a9145b055886413ed8edbb5632ee0830c8e'

default['jrb_workstation']['vagrant']['plugins'] = [
  'vagrant-berkshelf',
  'vagrant-omnibus',
  'vagrant-vbguest'
]
