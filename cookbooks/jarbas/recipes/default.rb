#
# Cookbook:: jarbas
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

case node['platform']
when 'mac_os_x'
    include_recipe 'jarbas::platform_mac_os_x'
when 'arch', 'manjaro'
    include_recipe 'jarbas::platform_arch'
else
    raise 'Unsupported platform'
end

include_recipe 'jarbas::git'
include_recipe 'jarbas::zsh'
include_recipe 'jarbas::bash'
include_recipe 'jarbas::vim'
include_recipe 'jarbas::ranger'
include_recipe 'jarbas::urxvt'
include_recipe 'jarbas::packages'

case node['platform']
when 'mac_os_x'
    include_recipe 'jarbas::platform_mac_os_x_post'
when 'arch', 'manjaro'
    include_recipe 'jarbas::platform_arch_post'
else
    raise 'Unsupported platform'
end
