#
# Cookbook:: jarbas
# Recipe:: rdp
#
# Copyright:: 2022, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'freerdp'
  jarbas_package 'remmina'
when 'mac_os_x'
  homebrew_cask 'microsoft-remote-desktop'
else
  raise 'Unsupported platform'
end
