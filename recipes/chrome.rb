#
# Cookbook:: jarbas
# Recipe:: chrome
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'google-chrome'
when 'mac_os_x'
  homebrew_cask 'google-chrome'
else
  raise 'Unsupported platform'
end
