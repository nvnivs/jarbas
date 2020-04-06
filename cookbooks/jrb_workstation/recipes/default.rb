#
# Cookbook:: jrb_workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

include_recipe 'jrb_workstation::zsh'
include_recipe 'jrb_workstation::vim'
include_recipe 'jrb_workstation::commandi_line_tools' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew_cask' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::ruby'
include_recipe 'jrb_workstation::python'
include_recipe 'jrb_workstation::aws'
include_recipe 'jrb_workstation::bash_profile'
include_recipe 'jrb_workstation::powerline_fonts'
include_recipe 'jrb_workstation::iterm' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::vagrant' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::vscode' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::kubernetes' if node['platfrom'] == 'mac_os_x'
include_recipe 'jrb_workstation::osx_settings' if node['platform'] == 'mac_os_x'
