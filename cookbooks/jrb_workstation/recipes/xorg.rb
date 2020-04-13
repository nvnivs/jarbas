#
# Cookbook:: jrb_workstation
# Recipe:: xorg
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jrb_workstation']['home']
user = node['jrb_workstation']['user']

# xorgs setup
package 'xorg-server'
package 'xorg-xinit'

# Manage screen resolution
package 'xorg-xrandr'

template "#{home}/.xinitrc" do
  source 'xinitrc.erb'
  owner  user
  mode   '0644'
end


