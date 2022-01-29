#
# Cookbook:: jarbas
# Recipe:: xorg
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jarbas']['home']
user = node['jarbas']['user']

# xorg
jarbas_package 'xorg-server'

template "#{home}/.Xresources" do
  source 'Xresources.erb'
  owner  user
  mode   '0644'
end

# xinit
jarbas_package 'xorg-xinit'

template "#{home}/.xinitrc" do
  source 'xinitrc.erb'
  owner  user
  mode   '0644'
end

# Manage screen resolution
jarbas_package 'xorg-xrandr'

# Command line interface to the X11 clipboard
jarbas_package 'xclip'
