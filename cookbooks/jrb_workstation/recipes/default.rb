#
# Cookbook:: jrb_workstation
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# OS configuration
include_recipe 'jrb_workstation::arch' if node['platform'] == 'arch'
include_recipe 'jrb_workstation::mac_os_x' if node['platform'] == 'mac_os_x'

include_recipe 'jrb_workstation::zsh'
include_recipe 'jrb_workstation::bash_profile'
include_recipe 'jrb_workstation::powerline_fonts'
include_recipe 'jrb_workstation::vim'
include_recipe 'jrb_workstation::git'
include_recipe 'jrb_workstation::ranger'
include_recipe 'jrb_workstation::command_line_tools' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::brew_cask' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::ruby'
include_recipe 'jrb_workstation::python'
include_recipe 'jrb_workstation::aws'

# Terminal
include_recipe 'jrb_workstation::termite' if node['platform'] == 'arch'
include_recipe 'jrb_workstation::iterm' if node['platform'] == 'mac_os_x'

# Brwoser
include_recipe 'jrb_workstation::qutebrowser' if node['platform'] == 'arch'

include_recipe 'jrb_workstation::vagrant' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::vscode' if node['platform'] == 'mac_os_x'
include_recipe 'jrb_workstation::kubernetes' if node['platfrom'] == 'mac_os_x'

# Window manager
include_recipe 'jrb_workstation::xorg' if node['platfrom'] == 'arch'
include_recipe 'jrb_workstation::i3' if node['platfrom'] == 'arch'
