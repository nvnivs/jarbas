#
# Cookbook:: jarbas
# Recipe:: go
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# Install go
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'go'
when 'mac_os_x'
  jarbas_package 'golang'
else
  raise 'Unsupported platform'
end

# Dependency manager
jarbas_package 'dep'
