#
# Cookbook:: jarbas
# Recipe:: i3_mac
#
# Copyright:: 2022, The Authors, All Rights Reserved.
#
# i3wm like support for Mac

# yabai is a window management utility that is designed to work as an extension to the built-in window manager of macOS.
jarbas_package 'koekeishiya/formulae/yabai'

# Open System Preferences.app and navigate to Security & Privacy, then Privacy, then Accessibility. 
# Click the lock icon at the bottom and enter your password to allow changes to the list. 
# Starting with brew services start yabai will prompt the user to allow yabai accessibility permissions. 
# Check the box next to yabai to allow accessibility permissions.

# start yabai
service 'yabai' do
    action [ :enable, :start ]
end

# create yabai configuration file
template "#{node['jarbas']['home']}/.yabairc" do
  source 'yabairc.erb'
  owner  user
  mode   '0700'
end
