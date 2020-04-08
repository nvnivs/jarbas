#
# Cookbook:: jrb_workstation
# Recipe:: mac_os_x
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

plist 'General: Appearance' do
  path "#{node['jrb_workstation']['home']}/Library/Preferences/.GlobalPreferences.plist"
  entry 'AppleInterfaceStyle'
  value 'Dark'
  not_if "sudo -u #{node['jrb_workstation']['user']} defaults read NSGlobalDomain |grep AppleInterfaceStyle |grep Dark"
end

plist 'General: Accent colour' do
  path "#{node['jrb_workstation']['home']}/Library/Preferences/.GlobalPreferences.plist"
  entry 'AppleAquaColorVariant'
  value 6
  not_if "sudo -u #{node['jrb_workstation']['user']} defaults read NSGlobalDomain |grep AppleAquaColorVariant |grep 6"
end

plist 'show hidden files in finder' do
  path "#{node['jrb_workstation']['home']}/Library/Preferences/com.apple.finder.plist"
  entry 'AppleShowAllFiles'
  value true
  not_if "sudo -u #{node['jrb_workstation']['user']} defaults read com.apple.finder AppleShowAllFiles |grep 1"
end
