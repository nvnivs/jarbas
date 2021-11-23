#
# Cookbook:: jarbas
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# OS configuration
include_recipe 'jarbas::platform_arch' if node['platform'] == 'arch'
include_recipe 'jarbas::platform_mac_os_x' if node['platform'] == 'mac_os_x'

include_recipe 'jarbas::git'
include_recipe 'jarbas::zsh'
include_recipe 'jarbas::bash'
include_recipe 'jarbas::vim'
include_recipe 'jarbas::ranger'
include_recipe 'jarbas::packages'
include_recipe 'jarbas::vscode'
include_recipe 'jarbas::brave'

include_recipe 'jarbas::platform_mac_os_x_post' if node['platform'] == 'mac_os_x'