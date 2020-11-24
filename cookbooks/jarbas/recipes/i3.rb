#
# Cookbook:: jarbas
# Recipe:: i3
#
# Copyright:: 2020, The Authors, All Rights Reserved.

include_recipe 'jarbas::xorg'

home = node['jarbas']['home']
user = node['jarbas']['user']

# i3 window manager
package 'i3-wm'

directory "#{home}/.config/i3" do
  owner user
  mode  '0755'
end

template "#{home}/.config/i3/config" do
  source 'i3_config.erb'
  owner  user
  mode   '0644'
end

directory "#{home}/.i3" do
  owner user
  mode  '0755'
end

# i3 status
package 'i3status'

directory "#{home}/.config/i3status" do
  owner user
  mode  '0755'
end

template "#{home}/.config/i3status/config" do
  source 'i3status_config.erb'
  owner  user
  mode   '0644'
end

# i3 lock
package 'i3lock'

# rofi, a replacement for dmenu
package 'rofi'

directory "#{home}/.config/rofi/" do
  owner user
  mode  '0755'
end

template "#{home}/.config/rofi/config" do
  source 'rofi_config.erb'
  owner  user
  mode   '0644'
end
