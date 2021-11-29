#
# Cookbook:: jarbas
# Recipe:: slack
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'mac_os_x' then
  homebrew_cask 'slack'
else
  raise 'Unsupported platform'
end
