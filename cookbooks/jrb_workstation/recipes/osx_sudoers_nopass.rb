#
# Cookbook:: jrb_workstation
# Recipe:: osx_sudoers_nopass
#
# Copyright:: 2019, The Authors, All Rights Reserved.
#
# Description: Disables pass for root user on sudoers to enable non-interactive commands in chef

cookbook_file '/etc/sudoers' do
  source 'sudoers_nopass'
  owner 'root'
  group 'wheel'
  mode '0440'
end
