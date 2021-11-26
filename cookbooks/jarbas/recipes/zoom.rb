#
# Cookbook:: jarbas
# Recipe:: zoom
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if node['platform'] == 'mac_os_x' then
  homebrew_cask 'zoom'
else
  raise 'Unsupported platform'
end
