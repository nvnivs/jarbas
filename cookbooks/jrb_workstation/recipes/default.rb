#
# Cookbook:: jrb_workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'jrb_workstation::zsh'
include_recipe 'jrb_workstation::vim'
include_recipe 'jrb_workstation::command-line-tools' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew-cask' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::ruby'
include_recipe 'jrb_workstation::python'
include_recipe 'jrb_workstation::bash_profile'
include_recipe 'jrb_workstation::powerline_fonts'
include_recipe 'jrb_workstation::iterm'
include_recipe 'jrb_workstation::vagrant'
include_recipe 'jrb_workstation::vscode'
include_recipe 'jrb_workstation::kubernetes'
include_recipe 'jrb_workstation::osx-settings' if node['platform'] == 'mac_os_x'
