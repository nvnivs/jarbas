#
# Cookbook:: jarbas
# Recipe:: termite
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jarbas']['home']
user = node['jarbas']['user']

package 'termite'

directory "#{home}/.config/termite/" do
  owner user
  mode  '0755'
end

template "#{home}/.config/termite/config" do
  source 'termite_config.erb'
  owner  user
  mode   '0644'
end
