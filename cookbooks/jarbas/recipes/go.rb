#
# Cookbook:: jarbas
# Recipe:: go
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# Core compiler tools for the Go programming language
case node['platform']
when 'arch', 'manjaro'
  jarbas_package 'go-pie'
else
  raise 'Unsupported platform'
end

# Dependency manager
jarbas_package 'dep'
