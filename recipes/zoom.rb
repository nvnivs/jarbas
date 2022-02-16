#
# Cookbook:: jarbas
# Recipe:: zoom
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if platform?('mac_os_x')
  homebrew_cask 'zoom'
else
  raise 'Unsupported platform'
end
