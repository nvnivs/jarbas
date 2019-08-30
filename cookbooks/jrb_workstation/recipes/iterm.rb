#
# Cookbook:: jrb_workstation
# Recipe:: iterm
#
# Copyright:: 2019, The Authors, All Rights Reserved.

homebrew_cask 'iterm2'

cookbook_file "#{node['jrb_workstation']['home']}/Library/Preferences/com.googlecode.iterm2.plist" do
  source 'Preferences/com.googlecode.iterm2.plist'
  owner node['jrb_workstation']['user']
  mode 0600
end
