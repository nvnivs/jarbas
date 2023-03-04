#
# Cookbook:: jarbas
# Recipe:: i3
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'jarbas::xorg'

home = node['jarbas']['home']
user = node['jarbas']['user']

# i3 window manager
jarbas_package 'i3-wm'

directory "#{home}/.i3" do
  owner user
  mode  '0755'
end

template "#{home}/.i3/config" do
  source 'i3_config.erb'
  owner  user
  mode   '0644'
end

# i3 status
case node['platform']
when 'arch'
  jarbas_package 'i3status'

  directory "#{home}/.config/i3status" do
    owner user
    mode  '0755'
  end

  template "#{home}/.config/i3status/config" do
    source 'i3status_config.erb'
    owner  user
    mode   '0644'
  end
when 'manjaro'
  jarbas_package 'i3status-manjaro'
else
  raise 'Unsupported platform'
end

# i3 lock
jarbas_package 'i3lock'
