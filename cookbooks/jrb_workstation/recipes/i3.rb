#
# Cookbook:: jrb_workstation
# Recipe:: i3
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jrb_workstation']['home']
user = node['jrb_workstation']['user']

# xorgs setup
package 'xorg-server'
package 'xorg-xinit'

# To manage screen resolution
#TODO: currently failing with "Can't open display"
package 'xorg-xrandr'

template "#{home}/.xinitrc" do
  source 'xinitrc.erb'
  owner  user
  mode   '0644'
end

# i3
package 'i3-wm'

template "#{home}/.config/i3/config" do
  source 'i3_config.erb'
  owner  user
  mode   '0644'
end

# i3 status
package 'i3status'

directory "#{home}/.config/i3status/" do
  owner user
  group user
  mode  '0755'
end

template "#{home}/.config/i3status/config" do
  source 'i3status_config.erb'
  owner  user
  group  user
  mode   '0644'
end

package 'i3lock'
package 'rofi'
