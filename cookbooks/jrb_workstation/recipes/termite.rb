#
# Cookbook:: jrb_workstation
# Recipe:: termite
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jrb_workstation']['home']

package 'termite'

directory "#{home}/.config/termite/" do
  owner user
  group user
  mode  '0755'
end

template "#{home}/.config/termite/config" do
  source 'termite_config.erb'
  owner  user
  group  user
  mode   '0644'
end


