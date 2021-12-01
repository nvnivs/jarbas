#
# Cookbook:: jarbas
# Recipe:: heroku
#
# Copyright:: 2021, The Authors, All Rights Reserved.


case node['platform']
when 'arch', 'manjaro'
  jarbas_yay_package 'heroku-cli-bin'
when 'mac_os_x'
  homebrew_package 'heroku'
else
  raise 'Unsupported platform'
end
