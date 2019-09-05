#
# Cookbook:: jrb_workstation
# Recipe:: osx-settings
#
# Copyright:: 2019, The Authors, All Rights Reserved.

execute 'kill_dock' do
  command 'killall Dock'
  action :nothing
end

plist 'disable dashboard' do
  path "#{node['jrb_workstation']['home']}/Library/Preferences/com.apple.dashboard.plist"
  entry 'mcx-disabled'
  value true
  only_if 'ps ax |grep [D]ash'
  notifies :run, 'execute[kill_dock]', :delayed
end

#TODO: Need to work out how to reload after execution
plist 'set dark appearance' do
  path "#{node['jrb_workstation']['home']}/Library/Preferences/.GlobalPreferences.plist"
  entry 'AppleInterfaceStyle'
  value 'Dark'
  not_if "sudo -u #{node['jrb_workstation']['user']} defaults read NSGlobalDomain |grep AppleInterfaceStyle |grep Dark"
end

plist 'show hidden files in finder' do
  path "#{node['jrb_workstation']['home']}/Library/Preferences/com.apple.finder.plist"
  entry 'AppleShowAllFiles'
  value true
  not_if "sudo -u #{node['jrb_workstation']['user']} defaults read com.apple.finder AppleShowAllFiles |grep 1"
end
