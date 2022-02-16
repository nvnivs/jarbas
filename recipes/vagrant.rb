#
# Cookbook:: jarbas
# Recipe:: vagrant
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# Vagrant is failing on the version 2.2.5 due to issues with the plugins and the version of ruby

case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'vagrant'
when 'mac_os_x'
  vagrant 'install_vagrant' do
    version  node['jarbas']['vagrant']['version']
    checksum node['jarbas']['vagrant']['checksum']
  end
else
  raise 'Unsupported platform'
end

node['jarbas']['vagrant']['plugins'].each do |p|
  vagrant_plugin p
end
