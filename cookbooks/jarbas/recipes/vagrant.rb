#
# Cookbook:: jarbas
# Recipe:: vagrant
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Vagrant is failing on the version 2.2.5 due to issues with the plugins and the version of ruby

jarbas_package 'vagrant' do
  not_if  { node['platform'] == 'mac_os_x' }
end

vagrant 'install_vagrant' do
  version  node['jarbas']['vagrant']['version']
  checksum node['jarbas']['vagrant']['checksum']
  only_if  { node['platform'] == 'mac_os_x' }
end

node['jarbas']['vagrant']['plugins'].each do |p|
  vagrant_plugin p
end
