#
# Cookbook:: jarbas
# Recipe:: spotify
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'spotify'
when 'mac_os_x'
  homebrew_cask 'spotify'
else
  raise 'Unsupported platform'
end
