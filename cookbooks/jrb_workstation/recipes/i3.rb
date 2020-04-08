#
# Cookbook:: jrb_workstation
# Recipe:: i3
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jrb_workstation']['home']
user = node['jrb_workstation']['user']

package 'xorg-server'
package 'xorg-xinit'
package 'i3-wm'

# To manage screen resolution
#TODO: currently failing with "Can't open display"
package 'xorg-xrandr'

template "#{home}/.xinitrc" do
  source 'xinitrc.erb'
  owner  user
  mode   '0644'
end

template "#{home}/.config/i3/config" do
  source 'i3config.erb'
  owner  user
  mode   '0644'
end
