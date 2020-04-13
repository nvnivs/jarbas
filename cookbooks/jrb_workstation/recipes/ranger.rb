#
# Cookbook:: jrb_workstation
# Recipe:: ranger
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jrb_workstation']['home']
user = node['jrb_workstation']['user']

package 'ranger'

directory "#{home}/.config/ranger/" do
  owner user
  mode  '0755'
end

template "#{home}/.config/ranger/rc.conf" do
  source 'rc_conf.erb'
  owner  user
  mode   '0644'
end
