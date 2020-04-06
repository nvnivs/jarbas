#
# Cookbook:: jrb_workstation
# Recipe:: vagrant
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Vagrant is failing on the version 2.2.5 due to issues with the plugins and the version of ruby
vagrant 'install_vagrant' do
  version node['jrb_workstation']['vagrant']['version']
  checksum node['jrb_workstation']['vagrant']['checksum']
end

node['jrb_workstation']['vagrant']['plugins'].each do |p|
  vagrant_plugin p
end
