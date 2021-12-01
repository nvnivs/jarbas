#
# Cookbook:: jarbas
# Recipe:: chef
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'chef-dk'
when 'mac_os_x'
  chef_client_updater 'Install latest'
else
  raise 'Unsupported platform'
end
