#
# Cookbook:: jarbas
# Recipe:: qutebrowser
#
# Copyright:: 2020, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'qutebrowser'
when 'mac_os_x'
  homebrew_cask 'qutebrowser'
else
  raise 'Unsupported platform'
end
