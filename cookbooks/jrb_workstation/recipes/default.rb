#
# Cookbook:: jrb_workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'jrb_workstation::osx-sudoers-nopass' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew-cask' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::vim'
include_recipe 'jrb_workstation::ruby'
include_recipe 'jrb_workstation::vagrant'
include_recipe 'jrb_workstation::python'
include_recipe 'jrb_workstation::osx-sudoers' if node['platform'] == 'mac_os_x'
