#
# Cookbook:: jarbas
# Recipe:: slack
#
# Copyright:: 2021, The Authors, All Rights Reserved.

if platform?('mac_os_x')
  homebrew_cask 'slack'
else
  raise 'Unsupported platform'
end
