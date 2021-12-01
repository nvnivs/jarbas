#
# Cookbook:: jarbas
# Recipe:: firefox
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'firefox-developer-edition'
when 'mac_os_x'
  homebrew_cask 'firefox-developer-edition'
else
  raise 'Unsupported platform'
end
