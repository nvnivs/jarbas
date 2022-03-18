#
# Cookbook:: jarbas
# Recipe:: chef
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'chef-workstation'
when 'mac_os_x'
  homebrew_cask 'cinc-workstation' do
    action :remove
  end
  homebrew_cask 'chefdk' do
    action :remove
  end
  homebrew_cask 'chef-workstation'
else
  raise 'Unsupported platform'
end
