#
# Cookbook:: jarbas
# Recipe:: rdp
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'mac_os_x'
  homebrew_cask 'microsoft-remote-desktop'
else
  raise 'Unsupported platform'
end
