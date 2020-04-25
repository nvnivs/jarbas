#
# Cookbook:: jarbas
# Recipe:: xorg
#
# Copyright:: 2020, The Authors, All Rights Reserved.

home = node['jarbas']['home']
user = node['jarbas']['user']

# xorg
package 'xorg-server'

template "#{home}/.Xresources" do
  source 'Xresources.erb'
  owner  user
  mode   '0644'
end

# xinit
package 'xorg-xinit'

template "#{home}/.xinitrc" do
  source 'xinitrc.erb'
  owner  user
  mode   '0644'
end

# Manage screen resolution
package 'xorg-xrandr'

# Command line interface to the X11 clipboard
package 'xclip'

# Launch shell commands with your keyboard or your mouse under X
package 'xbindkeys'
