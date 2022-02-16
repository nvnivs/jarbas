#
# Cookbook:: jarbas
# Recipe:: ranger
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jarbas']['home']
user = node['jarbas']['user']

jarbas_package 'ranger'

directory "#{home}/.config/" do
  owner user
  mode  '0755'
end

directory "#{home}/.config/ranger/" do
  owner user
  mode  '0755'
end

template "#{home}/.config/ranger/rc.conf" do
  source 'ranger/rc_conf.erb'
  owner  user
  mode   '0644'
end
