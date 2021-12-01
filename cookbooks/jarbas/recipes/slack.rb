#
# Cookbook:: jarbas
# Recipe:: slack
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'mac_os_x'
  homebrew_cask 'slack'
else
  raise 'Unsupported platform'
end

